QT -= core gui

TARGET = webrtc2sip
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

CONFIG += console
CONFIG -= app_bundle

QMAKE_CXXFLAGS += \
    -DHAVE_CONFIG_H

unix
{
    CONFIG(debug, debug|release) {
        LIBS += -L$$PWD/../build/debug -L$$PWD/../doubango/build/debug
        DESTDIR = $$PWD/../build/debug
    } else {
        LIBS += -L$$PWD/../build/release -L$$PWD/../doubango/build/release
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
    -ltinySIP \
    -ltinyDAV \
    -ltinyRTP \
    -ltinyMEDIA \
    -ltinyMSRP \
    -ltinyBFCP \
    -ltinySDP \
    -ltinySIGCOMP \
    -ltinySMS \
    -ltinyIPSec \
    -ltinyXCAP \
    -ltinyHTTP \
    -ltinyNET \
    -ltinySAK

LIBS += \
    -lavcodec\
    -lswscale \
    -lavutil \
    -lgsm \
    -lopus \
    -lopencore-amrnb \
    -lvpx \
    -lspeex \
    -lspeexdsp \
    -lcrypto \
    -lssl \
    -lsrtp \

LIBS += -lxml2 -lpthread -ldl
