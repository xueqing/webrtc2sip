QT -= core gui

TARGET = webrtc2sip
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

CONFIG += console
CONFIG -= app_bundle
CONFIG += c++11

QMAKE_CXXFLAGS += \
    -DHAVE_CONFIG_H

unix
{
    CONFIG(debug, debug|release) {
        LIBS += -L$$PWD/../build/debug
        DESTDIR = $$PWD/../build/debug
    } else {
        LIBS += -L$$PWD/../build/release
        DESTDIR = $$PWD/../build/release
    }
}

unix{
    target.path = /usr/lib
    INSTALLS += target
}

INCLUDEPATH += \
    $$PWD/../ \
    $$PWD/../tinywrap \
    /usr/local/include/tinysak \
    /usr/local/include/tinynet \
    /usr/local/include/tinyhttp \
    /usr/local/include/tinyxcap \
    /usr/local/include/tinyipsec \
    /usr/local/include/tinysms \
    /usr/local/include/tinysigcomp \
    /usr/local/include/tinysdp \
    /usr/local/include/tinybfcp \
    /usr/local/include/tinymsrp \
    /usr/local/include/tinymedia \
    /usr/local/include/tinyrtp \
    /usr/local/include/tinydav \
    /usr/local/include/tinysip \
    /usr/include/libxml2 \
    /usr/include

SOURCES += \
    $$PWD/../mp_mediaproxy.cc

LIBS += \
    -lmpLib \
    -ldb \
    -ljsoncpp \
    -ltinywrap

LIBS += \
    -L/usr/lib  \
    -L/usr/local/lib -ltinySAK \
    -L/usr/local/lib -ltinyNET \
    -L/usr/local/lib -ltinyHTTP \
    -L/usr/local/lib -ltinySIP \
    -L/usr/local/lib -ltinyDAV \
    -L/usr/local/lib -ltinySDP \
    -L/usr/local/lib -ltinyBFCP \
    -L/usr/local/lib -ltinySIGCOMP \
    -L/usr/local/lib -ltinyMEDIA \
    -L/usr/local/lib -ltinyXCAP \
    -L/usr/local/lib -ltinySMS \
    -L/usr/local/lib -ltinyMSRP \
    -L/usr/local/lib -ltinyRTP \
    -L/usr/local/lib -ltinyIPSec

LIBS += -lxml2 -lpthread -ldl
