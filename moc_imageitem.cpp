/****************************************************************************
** Meta object code from reading C++ file 'imageitem.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "imageitem.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'imageitem.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ImageItem_t {
    QByteArrayData data[29];
    char stringdata0[345];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ImageItem_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ImageItem_t qt_meta_stringdata_ImageItem = {
    {
QT_MOC_LITERAL(0, 0, 9), // "ImageItem"
QT_MOC_LITERAL(1, 10, 12), // "imageChanged"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 12), // "image_loaded"
QT_MOC_LITERAL(4, 37, 20), // "whole_image_uploaded"
QT_MOC_LITERAL(5, 58, 17), // "src_numberChanged"
QT_MOC_LITERAL(6, 76, 12), // "counting_end"
QT_MOC_LITERAL(7, 89, 8), // "setImage"
QT_MOC_LITERAL(8, 98, 7), // "QImage&"
QT_MOC_LITERAL(9, 106, 5), // "image"
QT_MOC_LITERAL(10, 112, 13), // "setSrc_number"
QT_MOC_LITERAL(11, 126, 4), // "int&"
QT_MOC_LITERAL(12, 131, 3), // "src"
QT_MOC_LITERAL(13, 135, 9), // "load_next"
QT_MOC_LITERAL(14, 145, 13), // "prevous_bunch"
QT_MOC_LITERAL(15, 159, 10), // "load_image"
QT_MOC_LITERAL(16, 170, 8), // "get_path"
QT_MOC_LITERAL(17, 179, 5), // "input"
QT_MOC_LITERAL(18, 185, 12), // "label_number"
QT_MOC_LITERAL(19, 198, 21), // "return_number_of_imgs"
QT_MOC_LITERAL(20, 220, 13), // "set_a_new_img"
QT_MOC_LITERAL(21, 234, 1), // "i"
QT_MOC_LITERAL(22, 236, 17), // "set_source_number"
QT_MOC_LITERAL(23, 254, 22), // "get_total_image_passed"
QT_MOC_LITERAL(24, 277, 18), // "get_total_img_size"
QT_MOC_LITERAL(25, 296, 18), // "update_information"
QT_MOC_LITERAL(26, 315, 9), // "get_count"
QT_MOC_LITERAL(27, 325, 8), // "get_name"
QT_MOC_LITERAL(28, 334, 10) // "src_number"

    },
    "ImageItem\0imageChanged\0\0image_loaded\0"
    "whole_image_uploaded\0src_numberChanged\0"
    "counting_end\0setImage\0QImage&\0image\0"
    "setSrc_number\0int&\0src\0load_next\0"
    "prevous_bunch\0load_image\0get_path\0"
    "input\0label_number\0return_number_of_imgs\0"
    "set_a_new_img\0i\0set_source_number\0"
    "get_total_image_passed\0get_total_img_size\0"
    "update_information\0get_count\0get_name\0"
    "src_number"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ImageItem[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      19,   14, // methods
       2,  140, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  109,    2, 0x06 /* Public */,
       3,    0,  110,    2, 0x06 /* Public */,
       4,    0,  111,    2, 0x06 /* Public */,
       5,    0,  112,    2, 0x06 /* Public */,
       6,    0,  113,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       7,    1,  114,    2, 0x02 /* Public */,
      10,    1,  117,    2, 0x02 /* Public */,
      13,    0,  120,    2, 0x02 /* Public */,
      14,    0,  121,    2, 0x02 /* Public */,
      15,    0,  122,    2, 0x02 /* Public */,
      16,    2,  123,    2, 0x02 /* Public */,
      19,    0,  128,    2, 0x02 /* Public */,
      20,    1,  129,    2, 0x02 /* Public */,
      22,    1,  132,    2, 0x02 /* Public */,
      23,    0,  135,    2, 0x02 /* Public */,
      24,    0,  136,    2, 0x02 /* Public */,
      25,    0,  137,    2, 0x02 /* Public */,
      26,    0,  138,    2, 0x02 /* Public */,
      27,    0,  139,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, 0x80000000 | 8,    9,
    QMetaType::Void, 0x80000000 | 11,   12,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   17,   18,
    QMetaType::Int,
    QMetaType::Int, QMetaType::Int,   21,
    QMetaType::Int, QMetaType::Int,   21,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Void,
    QMetaType::Int,
    QMetaType::QString,

 // properties: name, type, flags
       9, QMetaType::QImage, 0x00495103,
      28, QMetaType::Int, 0x00495103,

 // properties: notify_signal_id
       0,
       3,

       0        // eod
};

void ImageItem::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ImageItem *_t = static_cast<ImageItem *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->imageChanged(); break;
        case 1: _t->image_loaded(); break;
        case 2: _t->whole_image_uploaded(); break;
        case 3: _t->src_numberChanged(); break;
        case 4: _t->counting_end(); break;
        case 5: _t->setImage((*reinterpret_cast< QImage(*)>(_a[1]))); break;
        case 6: _t->setSrc_number((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->load_next(); break;
        case 8: _t->prevous_bunch(); break;
        case 9: _t->load_image(); break;
        case 10: _t->get_path((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 11: { int _r = _t->return_number_of_imgs();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 12: { int _r = _t->set_a_new_img((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 13: { int _r = _t->set_source_number((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 14: { int _r = _t->get_total_image_passed();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 15: { int _r = _t->get_total_img_size();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 16: _t->update_information(); break;
        case 17: { int _r = _t->get_count();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 18: { QString _r = _t->get_name();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ImageItem::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ImageItem::imageChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ImageItem::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ImageItem::image_loaded)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ImageItem::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ImageItem::whole_image_uploaded)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ImageItem::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ImageItem::src_numberChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ImageItem::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ImageItem::counting_end)) {
                *result = 4;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ImageItem *_t = static_cast<ImageItem *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QImage*>(_v) = _t->image(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->src_number(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        ImageItem *_t = static_cast<ImageItem *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setImage(*reinterpret_cast< QImage*>(_v)); break;
        case 1: _t->setSrc_number(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject ImageItem::staticMetaObject = { {
    &QQuickPaintedItem::staticMetaObject,
    qt_meta_stringdata_ImageItem.data,
    qt_meta_data_ImageItem,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ImageItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ImageItem::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ImageItem.stringdata0))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int ImageItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 19)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 19;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 19)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 19;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ImageItem::imageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void ImageItem::image_loaded()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ImageItem::whole_image_uploaded()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void ImageItem::src_numberChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ImageItem::counting_end()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
