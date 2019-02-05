QT += quick widgets
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    imageitem.cpp \
    img_holder.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    imageitem.h \
    img_holder.h
INCLUDEPATH += /usr/local/include/opencv4
LIBS += -L/usr/local/lib -lopencv_stitching -lopencv_superres -lopencv_videostab -lopencv_tracking -lopencv_img_hash -lopencv_bgsegm -lopencv_cudabgsegm -lopencv_hfs -lopencv_cudastereo -lopencv_reg -lopencv_rgbd -lopencv_face -lopencv_photo -lopencv_stereo -lopencv_plot -lopencv_cudacodec -lopencv_line_descriptor -lopencv_cudaoptflow -lopencv_dpm -lopencv_saliency -lopencv_freetype -lopencv_ccalib -lopencv_aruco -lopencv_bioinspired -lopencv_datasets -lopencv_text -lopencv_cudafeatures2d -lopencv_cudaobjdetect -lopencv_cudalegacy -lopencv_cudaimgproc -lopencv_cudafilters -lopencv_cudawarping -lopencv_surface_matching -lopencv_optflow -lopencv_ximgproc -lopencv_video -lopencv_dnn_objdetect -lopencv_dnn -lopencv_xphoto -lopencv_xobjdetect -lopencv_objdetect -lopencv_xfeatures2d -lopencv_shape -lopencv_ml -lopencv_cudaarithm -lopencv_fuzzy -lopencv_structured_light -lopencv_calib3d -lopencv_features2d -lopencv_highgui -lopencv_videoio -lopencv_imgcodecs -lopencv_phase_unwrapping -lopencv_imgproc -lopencv_flann -lopencv_core -lopencv_cudev

