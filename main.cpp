#include <QApplication>
#include <QQmlApplicationEngine>
#include <imageitem.h>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<ImageItem>("myextension", 1, 0, "ImageItem");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
