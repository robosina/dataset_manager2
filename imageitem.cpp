// ImageItem.cpp
#include "imageitem.h"
#include <thread>
using namespace std;
#define deubg_mode 0
ImageItem::ImageItem(QQuickItem *parent) : QQuickPaintedItem(parent)
{

}

void ImageItem::paint(QPainter *painter)
{
    cout<<"painte"<<endl;
    QRectF bounding_rect = boundingRect();
    QImage scaled = this->current_image.scaledToHeight(bounding_rect.height());
    QPointF center = bounding_rect.center() - scaled.rect().center();

    if (center.x() < 0)
        center.setX(0);
    if (center.y() < 0)
        center.setY(0);
    painter->drawImage(center, scaled);
}

QImage ImageItem::image() const
{
    return this->current_image;
}

int ImageItem::src_number() const
{
    return current_number;
}

void ImageItem::load_next()
{
    num_of_ids=0;
    while (num_of_ids<=2000 && iter_img<=image_list.size()-1) {
        QString image_name=image_list[iter_img];
        QString text_name=get_text_name(image_name);
        QFile file(text_name);
        file.open(QIODevice::ReadWrite);
        QTextStream in2(&file);
        while(!in2.atEnd())
        {
            QString line=in2.readLine();
            QStringList list = line.split(QRegExp("\\s+"), QString::SkipEmptyParts);
            if(list.size()==5)
            {
                if(QString(list[0]).toInt()==label_num)
                {
                    img_holder hld;
                    hld.y=QString(list[2]).toDouble();
                    hld.x=QString(list[1]).toDouble();
                    hld.w=QString(list[3]).toDouble();
                    hld.h=QString(list[4]).toDouble();
                    hld.text_name=text_name;
                    hld.image_name=image_name;
                    hld.id_number=num_of_ids;

                    num_of_ids++;

                    Mat img=imread(image_name.toStdString());
                    Rect r((hld.x-hld.w/2)*img.cols,
                           (hld.y-hld.h/2)*img.rows,
                           hld.w*img.cols,
                           hld.h*img.rows);
                    r=r& Rect(1,1,img.cols-1,img.rows-1);
                    Mat new_img=img(r).clone();
                    cvtColor(new_img,new_img,cv::COLOR_BGR2RGB);
                    hld.img=new_img;
                    id_vector.push_back(hld);
                    cv::normalize(new_img,new_img,255,0,NORM_MINMAX);
                    cv::resize(new_img,new_img,Size(60,60));
                    imwrite("label/"+to_string(hld.id_number)+".jpg",new_img);
                }
            }
        }
        file.close();
        iter_img++;
        cout<<iter_img<<" "<<num_of_ids<<endl;
    }
    cout<<"finished"<<endl;
    if(num_of_ids>0)
    {
        emit whole_image_uploaded();
    }
}

void ImageItem::prevous_bunch()
{
    cout<<"load previous bunch"<<endl;
}

void ImageItem::load_image()
{
    QDirIterator it(src_path,
                    QStringList() << "*.jpg",
                    QDir::Files,
                    QDirIterator::Subdirectories);
    image_list.resize(0);
    while(it.hasNext())
    {
        image_list.push_back(it.next());
    }
    emit image_loaded();
}

void ImageItem::get_path(QString input,QString label_number)
{
    iter_img=0;
    qDebug()<<"I got the "<<input;
    qDebug()<<"I got label num is"<<label_number;
    src_path=input;
    label_num=label_number.toInt();
}

int ImageItem::return_number_of_imgs()
{
    return image_list.size();
}

int ImageItem::set_a_new_img(int i)
{
    Mat img=id_vector[i].img;
    //    imwrite("/home/nict/plate_finder_section/programs/find_wrong_labels/CQyhf.png",img);
    QImage imagen((uchar*)img.data,img.cols,img.rows,QImage::Format_RGB888);
    setImage(imagen);
}

int ImageItem::set_source_number(int i)
{
    Mat img=id_vector[i].img;
    //    imwrite("/home/nict/plate_finder_section/programs/find_wrong_labels/CQyhf.png",img);
    QImage imagen((uchar*)img.data,img.cols,img.rows,QImage::Format_RGB888);
    setImage(imagen);
}

int ImageItem::get_total_image_passed()
{
    return iter_img;
}

int ImageItem::get_total_img_size()
{
    return num_of_ids;
}

QString ImageItem::get_text_name(QString &input)
{
    QStringList l=input.split(".");
    return l[0]+".txt";
}


void ImageItem::setImage(QImage &image)
{
    this->current_image = image;
    update();
}

void ImageItem::setSrc_number(int &src)
{
    this->current_image = QImage("label/"+QString::number(src)+".jpg");
    //    Mat img=imread("label/"+to_string(src)+".jpg");
    //    cvtColor(img,img,cv::COLOR_BGR2GRAY);
    ////    imshow("img",img);
    ////    waitKey(0);
    //    cv::resize(img,img,Size(200,200));
    //    QImage imagen((uchar*)img.data,img.cols,img.rows,QImage::Format_Grayscale8);
    //        setImage(imagen);
    //    this->current_number=src;

    cout<<"loading:"<<"label/"+to_string(src)+".jpg"<<endl;
}
