// ImageItem.h
#ifndef IMAGEITEM_H
#define IMAGEITEM_H
#include <QQuickPaintedItem>
#include <QQuickItem>
#include <QPainter>
#include <QImage>
#include <opencv2/opencv.hpp>
#include <iostream>
using namespace std;
using namespace cv;
#include <QtConcurrent/QtConcurrent>
#include <memory>
#include <thread>
#include <QDebug>
#include <QDirIterator>
#include <img_holder.h>
#include <QDir>

class ImageItem : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QImage image READ image WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(int src_number READ src_number WRITE setSrc_number NOTIFY src_numberChanged)
public:

    ImageItem(QQuickItem *parent = nullptr);
    Q_INVOKABLE void setImage(QImage &image);
    Q_INVOKABLE void setSrc_number(int& src);
    void paint(QPainter *painter);
    QImage image() const;
    int src_number() const;
    Mat img;
    QString previous_string;
    Q_INVOKABLE void load_next();
    Q_INVOKABLE void prevous_bunch();
    Q_INVOKABLE void load_image();
    Q_INVOKABLE void get_path(QString input, QString label_number);
    Q_INVOKABLE int return_number_of_imgs();
    Q_INVOKABLE int set_a_new_img(int i);
    Q_INVOKABLE int set_source_number(int i);
    Q_INVOKABLE int get_total_image_passed();
    Q_INVOKABLE int get_total_img_size();
    QString src_path;int label_num;
    int iter_img{0},num_of_ids{0};
    vector<QString> image_list;
    vector<img_holder> id_vector;
    QString get_text_name(QString& input);

signals:
    void imageChanged();
    void image_loaded();
    void whole_image_uploaded();
    void src_numberChanged();
private:
    QImage current_image;
    int current_number;
};
#endif // IMAGEITEM_H
