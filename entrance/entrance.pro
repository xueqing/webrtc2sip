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
    $$PWD/../doubango/tinySAK/src \
    $$PWD/../doubango/tinyNET/src \
    $$PWD/../doubango/tinyHTTP/include \
    $$PWD/../doubango/tinyXCAP/include \
    $$PWD/../doubango/tinyIPSec/src \
    $$PWD/../doubango/tinySMS/include \
    $$PWD/../doubango/tinySIGCOMP/src \
    $$PWD/../doubango/tinySDP/include \
    $$PWD/../doubango/tinyBFCP/include \
    $$PWD/../doubango/tinyMSRP/include \
    $$PWD/../doubango/tinyMEDIA/include \
    $$PWD/../doubango/tinyRTP/include \
    $$PWD/../doubango/tinyDAV/include \
    $$PWD/../doubango/tinySIP/include \
    $$PWD/../include/libxml2 \
    $$PWD/../include

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
    -Llib/ffmpeg -lavcodec\
    -lswscale \
    -lavutil \
    -Llib/gsm -lgsm \
    -Llib/opus -lopus \
    -Llib/opencore-amr -lopencore-amrnb \
    -Llib/vpx -lvpx \
    -Llib/speex -lspeex \
    -lspeexdsp \
    -Llib/openssl -lcrypto \
    -lssl \
    -Llib/srtp -lsrtp \

LIBS += -lxml2 -lpthread -ldl
