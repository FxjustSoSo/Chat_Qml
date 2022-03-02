#ifndef UDPSERVER_H
#define UDPSERVER_H

#include <QObject>
#include <list>
#include <map>
class QUdpSocket;
class QByteArray;
class QNetworkDatagram;
class UDPServer : public QObject
{
    Q_OBJECT
public:
    explicit UDPServer(QObject *parent = nullptr);

private:
    void processTheDatagram(QNetworkDatagram _nd);
private:
    QUdpSocket* pUdpRecv;
    QUdpSocket* pUdpSend;
    QByteArray mBaSend;

    std::map<int,QString> mmap_Port_Addr;
    const quint16 PORT = 10086;
signals:

public slots:
    void slotRecvData();
    void slotSendData(QByteArray _ba);

};

#endif // UDPSERVER_H
