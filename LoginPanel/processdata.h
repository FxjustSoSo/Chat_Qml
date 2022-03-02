#ifndef PROCESSDATA_H
#define PROCESSDATA_H

#include <QObject>

class UDP;
class ProcessData : public QObject
{
    Q_OBJECT
public:
    explicit ProcessData(QObject *parent = nullptr);

    Q_INVOKABLE void init();

private:

signals:
    void signalSend(QByteArray);

};

#endif // PROCESSDATA_H
