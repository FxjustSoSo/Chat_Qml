#include "udpserver.h"
#include <QUdpSocket>
#include <QNetworkDatagram>
#include <QByteArray>
#include "CommonApproach.h"
UDPServer::UDPServer(QObject *parent) : QObject(parent)
{
    pUdpRecv = new QUdpSocket(this);
    //读取
    pUdpRecv->bind(this->PORT);
    connect(pUdpRecv,&QUdpSocket::readyRead,this,&UDPServer::slotRecvData);
}

void UDPServer::processTheDatagram(QNetworkDatagram _nd)
{
    const int iSenderPort = _nd.senderPort();
    QString strSenderAddr = _nd.senderAddress().toString();

    if(strSenderAddr.contains("::ffff:"))
    {
        strSenderAddr = strSenderAddr.mid(7);
    }
    mmap_Port_Addr[iSenderPort] = strSenderAddr;//存储端口和IP
    cout << iSenderPort << "\t" << strSenderAddr;


    QByteArray baData = _nd.data();
}

void UDPServer::slotRecvData()
{
    while (pUdpRecv->hasPendingDatagrams())
    {
        QNetworkDatagram datagram = pUdpRecv->receiveDatagram();
        processTheDatagram(datagram);
    }
}

void UDPServer::slotSendData(QByteArray _ba)
{
    //发送
    pUdpSend = new QUdpSocket(this);
    pUdpSend->writeDatagram(_ba,QHostAddress("127.0.0.1"),this->PORT);
}
