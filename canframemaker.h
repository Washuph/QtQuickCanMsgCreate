#ifndef CANFRAMEMAKER_H
#define CANFRAMEMAKER_H

#include <QObject>
#include <QJsonArray>
#include <QJsonObject>

class CanFrameMaker : public QObject
{
    Q_OBJECT
public:


    explicit CanFrameMaker(QObject *parent = nullptr);
    ~ CanFrameMaker();
    Q_INVOKABLE QString makeFrame(const QString &string) const;

signals:

public slots:
};

#endif // CANFRAMEMAKER_H
