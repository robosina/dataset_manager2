#ifndef IMG_HOLDER_H
#define IMG_HOLDER_H
#include <QString>
#include <opencv2/opencv.hpp>
using namespace cv;
#include <iostream>
using namespace std;
class img_holder
{
public:
    img_holder();
    QString image_name;
    QString text_name;
    double x,y,h,w;
    int id_number;
    Mat img;
};

#endif // IMG_HOLDER_H
