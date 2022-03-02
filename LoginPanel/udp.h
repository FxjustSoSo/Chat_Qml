#ifndef UDP_H
#define UDP_H

#include <QObject>

class QUdpSocket;
class QByteArray;
class QNetworkDatagram;
class UDP : public QObject
{
    Q_OBJECT
public:
    explicit UDP(QObject *parent = nullptr);

private:
    void processTheDatagram(QNetworkDatagram _nd);
private:
    QUdpSocket* pUdpRecv;
    QUdpSocket* pUdpSend;
    const quint16 PORT = 10086;
signals:

public slots:
    void slotRecvData();
    void slotSendData(QByteArray _ba);
};

#endif // UDP_H
