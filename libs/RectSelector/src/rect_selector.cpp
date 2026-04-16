#include "RectSelector/rect_selector.h"
#include <iostream>

using namespace cv;
using namespace std;

RectSelector::RectSelector(const string &image_path)
    : m_imagePath(image_path),
      g_isDrawing(false),
      g_isDrawComplete(false) {}

RectSelector::~RectSelector()
{
    destroyAllWindows();
}

bool RectSelector::loadImage()
{
    g_srcImg = imread(m_imagePath);
    if (g_srcImg.empty())
    {
        cerr << "错误：无法加载图片 [" << m_imagePath << "]" << endl;
        return false;
    }
    cout << "✓ 图片加载成功：" << m_imagePath << endl;
    return true;
}

void RectSelector::showImage()
{
    namedWindow("Select Rect Region", WINDOW_NORMAL);
    g_displayImg = g_srcImg.clone();
    imshow("Select Rect Region", g_displayImg);
    setMouseCallback("Select Rect Region", onMouse, this);
}

// 将 selectRect() 函数修改为如下：
bool RectSelector::selectRect()
{
    while (true)
    {
        int k = waitKey(10);
        if (k != -1 && g_isDrawComplete)
        {
            break;
        }
        // 修复：使用正确的函数名 getWindowProperty
        if (!getWindowProperty("Select Rect Region", WND_PROP_VISIBLE))
        {
            break;
        }
    }
    return g_isDrawComplete;
}

void RectSelector::printInfo()
{
    cout << "\n---------------- 矩形信息 ----------------" << endl;
    cout << "  中心点坐标 (Center): ("
         << g_selectedRect.x + g_selectedRect.width / 2 << ", "
         << g_selectedRect.y + g_selectedRect.height / 2 << ")" << endl;
    cout << "  宽度 (Width): " << g_selectedRect.width << endl;
    cout << "  高度 (Height): " << g_selectedRect.height << endl;
    cout << "------------------------------------------" << endl;
}

void RectSelector::onMouse(int event, int x, int y, int flags, void *param)
{
    RectSelector *self = reinterpret_cast<RectSelector *>(param);
    if (self->g_isDrawComplete)
        return;

    if (event == EVENT_LBUTTONDOWN)
    {
        self->g_isDrawing = true;
        self->g_pt1 = Point(x, y);
        self->g_srcImg.copyTo(self->g_displayImg);
    }
    else if (event == EVENT_MOUSEMOVE && self->g_isDrawing)
    {
        self->g_pt2 = Point(x, y);
        self->g_srcImg.copyTo(self->g_displayImg);
        Rect tempRect = Rect(Point(min(self->g_pt1.x, self->g_pt2.x), min(self->g_pt1.y, self->g_pt2.y)),
                             Point(max(self->g_pt1.x, self->g_pt2.x), max(self->g_pt1.y, self->g_pt2.y)));
        rectangle(self->g_displayImg, tempRect, Scalar(0, 255, 0), 2);
        imshow("Select Rect Region", self->g_displayImg);
    }
    else if (event == EVENT_LBUTTONUP)
    {
        self->g_isDrawing = false;
        self->g_isDrawComplete = true;
        self->g_pt2 = Point(x, y);
        self->g_selectedRect = Rect(Point(min(self->g_pt1.x, self->g_pt2.x), min(self->g_pt1.y, self->g_pt2.y)),
                                    Point(max(self->g_pt1.x, self->g_pt2.x), max(self->g_pt1.y, self->g_pt2.y)));
        self->g_srcImg.copyTo(self->g_displayImg);
        rectangle(self->g_displayImg, self->g_selectedRect, Scalar(0, 255, 0), 2);
        imshow("Select Rect Region", self->g_displayImg);
        self->printInfo();
    }
}