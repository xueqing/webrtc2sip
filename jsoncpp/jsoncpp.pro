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
    /usr/local/include/tinysak \
    /usr/local/include/tinynet \
    /usr/local/include/tinysak \
    /usr/local/include/tinyhttp \
    /usr/local/include/tinynet \
    /usr/local/include/tinysak \
    /usr/local/include/tinysip \
    /usr/local/include/tinyhttp \
    /usr/local/include/tinyipsec \
    /usr/local/include/tinymedia \
    /usr/local/include/tinynet \
    /usr/local/include/tinysdp \
    /usr/local/include/tinysigcomp \
    /usr/local/include/tinysak \
    /usr/local/include/tinydav \
    /usr/local/include/tinybfcp \
    /usr/local/include/tinyrtp \
    /usr/local/include/tinymedia \
    /usr/local/include/tinymsrp \
    /usr/local/include/tinysdp \
    /usr/local/include/tinyhttp \
    /usr/local/include/tinynet \
    /usr/local/include/tinysak \
    /usr/local/include/tinysdp \
    /usr/local/include/tinysak \
    /usr/local/include/tinybfcp \
    /usr/local/include/tinynet \
    /usr/local/include/tinysak \
    /usr/local/include/tinysigcomp \
    /usr/local/include/tinysak \
    /usr/local/include/tinymedia \
    /usr/local/include/tinynet \
    /usr/local/include/tinysdp \
    /usr/local/include/tinysak \
    /usr/local/include/tinyxcap \
    /usr/local/include/tinyhttp \
    /usr/local/include/tinynet \
    /usr/local/include/tinysak \
    /usr/local/include/tinysms \
    /usr/local/include/tinysak \
    /usr/local/include/tinymsrp \
    /usr/local/include/tinysdp \
    /usr/local/include/tinyhttp \
    /usr/local/include/tinynet \
    /usr/local/include/tinysak \
    /usr/local/include/tinyrtp \
    /usr/local/include/tinymedia \
    /usr/local/include/tinynet \
    /usr/local/include/tinysdp \
    /usr/local/include/tinysak \
    /usr/local/include/tinyipsec \
    /usr/local/include/tinysak \
    /usr/include/libxml2 \
    /usr/include

HEADERS += \
    json/json.h \
    json/json-forwards.h

SOURCES += \
    jsoncpp.cc
