#include "canframemaker.h"
#include <QJsonParseError>
#include <QJsonArray>
#include <QByteArray>
#include <QDebug>

CanFrameMaker::CanFrameMaker(QObject *parent) : QObject(parent)
{


}

CanFrameMaker::~CanFrameMaker()
{

}

QString CanFrameMaker::makeFrame(const QString &string) const
{
    QJsonParseError jsonError;
    QByteArray byteArray;

    byteArray.append(string);
    qDebug() << string;

    QJsonDocument doucment = QJsonDocument::fromJson(byteArray, &jsonError);
    if (!doucment.isNull() && (jsonError.error == QJsonParseError::NoError)) {  // 解析未发生错误
        if (doucment.isObject()) { // JSON 文档为对象
            QJsonObject object = doucment.object();  // 转化为对象
            if (object.contains("offset")) {  // 包含指定的 key
                QJsonValue value = object.value("offset");  // 获取指定 key 对应的 value
                if (value.isDouble()) {  // 判断 value 是否为字符串
                    int strName = value.toVariant().toInt();  // 将 value 转化为字符串
                    qDebug() << "offset : " << strName;
                }
            }
            if (object.contains("len")) {
                QJsonValue value = object.value("len");
                if (value.isDouble()) {
                    int nFrom = value.toVariant().toInt();
                    qDebug() << "len : " << nFrom;
                }
            }
            if (object.contains("value")) {
                QJsonValue value = object.value("value");
                if (value.isDouble()) {
                    int val = value.toVariant().toInt();
                    qDebug() << "value : " << val;
                }
            }
            if (object.contains("precision")) {
                QJsonValue value = object.value("precision");
                if (value.isDouble()) {
                    int val = value.toVariant().toInt();
                    qDebug() << "precision : " << val;
                }
            }
            if (object.contains("format")) {
                QJsonValue value = object.value("format");
                if (value.isBool()) {
                    bool val = value.toBool();
                    qDebug() << "format : " << val; //true for intel
                }
            }
            if (object.contains("type")) {
                QJsonValue value = object.value("type");
                if (value.isString()) {

                    qDebug() << "type : " << value.String;
                }
            }
        }
    }
    else
    {
        qDebug() << "JSON ERROR";
    }

    return string;
}
