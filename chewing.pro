TEMPLATE = app
TARGET = qml-chewing
CONFIG += qt
QT += quick x11extras widgets
SOURCES += chewing.cpp

unix {
    CONFIG += link_pkgconfig
    PKGCONFIG += chewing libfakekey
}
