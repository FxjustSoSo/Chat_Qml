#include "processdata.h"
#include <QByteArray>
#include "CommonApproach.h"
#include "udp.h"

ProcessData::ProcessData(QObject *parent) : QObject(parent)
{
    UDP* pUdp = new UDP;
    connect(this,&ProcessData::signalSend,pUdp,&UDP::slotSendData);
}

void ProcessData::init()
{
    QString str("你好啊");
    QByteArray ba = str.toLocal8Bit();
    emit signalSend(ba);
}
