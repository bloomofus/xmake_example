#include <opencv2/opencv.hpp>
#include <iostream>
#include "rect_selector.h"

using namespace std;

const string IMAGE_PATH = "./test.jpg";

void printMenu()
{
    cout << "\n========================================" << endl;
    cout << "      OpenCV 矩形选择工具 v1.0          " << endl;
    cout << "========================================" << endl;
    cout << "  [1] 加载图片并框选矩形 (按 l/L)" << endl;
    cout << "  [Q/q] 退出程序                        " << endl;
    cout << "========================================" << endl;
    cout << "请输入选项: ";
}

int main()
{
    cout << "\n=== OpenCV Rectangle Selector ===" << endl;

    while (true)
    {
        char option;
        printMenu();
        cin >> option;

        // 清空输入缓冲区
        cin.ignore(1000, '\n');

        if (option == 'q' || option == 'Q')
        {
            cout << "✓ 程序已退出。" << endl;
            break;
        }
        else if (option == '1' || option == 'l' || option == 'L')
        {
            RectSelector selector(IMAGE_PATH);

            if (selector.loadImage())
            {
                cout << "\n正在打开图片... (请根据提示操作)" << endl;

                selector.showImage();

                if (selector.selectRect())
                {
                    cout << "\n✓ 框选完成！" << endl;
                }
                else
                {
                    cout << "\n✗ 框选取消或未成功。" << endl;
                }

                // 销毁窗口，等待返回终端
                destroyAllWindows();
            }
        }
        else
        {
            cout << "✗ 无效选项，请重新输入。" << endl;
        }
    }

    return 0;
}