#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "canframemaker.h"
#include <QtQml>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<CanFrameMaker>("wt.qt.CanFrameMaker", 0, 1, "CanFrameMaker");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
