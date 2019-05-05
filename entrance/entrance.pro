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

CI-TEST{
    QMAKE_LFLAGS += -Wl,-rpath,$$(INSTALL_PATH)/ci-test/commonlib:$$(INSTALL_PATH)/ci-test/doubangolib:$$PWD/../doubango/thirdparties/common/lib/x86_64
    target.path = $$(INSTALL_PATH)/ci-test
    INSTALLS = target
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
    $$PWD/../doubango/thirdparties/common/include/libxml2 \
    $$PWD/../doubango/thirdparties/common/include

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
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/ffmpeg -lavcodec -lswscale -lavutil \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/gsm -lgsm \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/opus -lopus \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/opencore -lopencore-amrnb \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/vpx -lvpx \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/speex -lspeex -lspeexdsp \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/openssl -lcrypto -lssl \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/srtp -lsrtp \
    -L$$PWD/../doubango/thirdparties/common/lib/x86_64/xml2 -lxml2 -licuuc -licudata

LIBS += -lpthread -ldl
