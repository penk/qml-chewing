TEMPLATE = app
TARGET = qml-chewing
CONFIG += qt
QT += declarative
SOURCES += chewing.cpp

unix {
    CONFIG += link_pkgconfig
    PKGCONFIG += chewing libfakekey
}
