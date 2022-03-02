#include "udp.h"
#include <QUdpSocket>
#include <QNetworkDatagram>
#include <QDebug>
#include <QByteArray>

UDP::UDP(QObject *parent) : QObject(parent)
{
    pUdpRecv = new QUdpSocket(this);
    //读取
//    pUdpRecv->bind(this->PORT);
//    connect(pUdpRecv,&QUdpSocket::readyRead,this,&UDP::slotRecvData);
}

void UDP::processTheDatagram(QNetworkDatagram _nd)
{
    QByteArray baData = _nd.data();
}

void UDP::slotRecvData()
{
    while (pUdpRecv->hasPendingDatagrams())
    {
        QNetworkDatagram datagram = pUdpRecv->receiveDatagram();
        processTheDatagram(datagram);
    }
}

void UDP::slotSendData(QByteArray _ba)
{
    //发送
    pUdpSend = new QUdpSocket(this);
    pUdpSend->writeDatagram(_ba,QHostAddress("127.0.0.1"),this->PORT);
}
