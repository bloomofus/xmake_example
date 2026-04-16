#ifndef RECT_SELECTOR_H
#define RECT_SELECTOR_H

#include <opencv2/opencv.hpp>
#include <string>

using namespace cv;
using namespace std;

class RectSelector
{
public:
    RectSelector(const string &image_path);
    ~RectSelector();

    bool loadImage();
    void showImage();
    bool selectRect();
    void printInfo();

private:
    static void onMouse(int event, int x, int y, int flags, void *param);

    Mat g_srcImg;
    Mat g_displayImg;
    Point g_pt1;
    Point g_pt2;
    Rect g_selectedRect;
    bool g_isDrawing;
    bool g_isDrawComplete;
    string m_imagePath;
};

#endif