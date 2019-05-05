QT -= core gui

TARGET = jsoncpp
TEMPLATE = lib

QMAKE_CXXFLAGS += \
    -DHAVE_CONFIG_H

unix {
    CONFIG(debug, debug|release) {
        DESTDIR = $$PWD/../build/debug
    } else {
        DESTDIR = $$PWD/../build/release
    }
}

unix {
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
    $$PWD/../doubango/thirdparties/common/include/libxml2 \
    $$PWD/../doubango/thirdparties/common/include

HEADERS += \
    json/json.h \
    json/json-forwards.h

SOURCES += \
    jsoncpp.cc
