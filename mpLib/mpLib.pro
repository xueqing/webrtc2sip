QT -= core gui

TARGET = mpLib
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
    $$PWD/../mp_c2c.h \
    $$PWD/../mp_common.h \
    $$PWD/../mp_config.h \
    $$PWD/../mp_engine.h \
    $$PWD/../mp_mail.h \
    $$PWD/../mp_mutex.h \
    $$PWD/../mp_net_transport.h \
    $$PWD/../mp_object.h \
    $$PWD/../mp_peer.h \
    $$PWD/../mp_proxyplugin.h \
    $$PWD/../mp_proxyplugin_consumer_audio.h \
    $$PWD/../mp_proxyplugin_consumer_video.h \
    $$PWD/../mp_proxyplugin_mgr.h \
    $$PWD/../mp_proxyplugin_producer_audio.h \
    $$PWD/../mp_proxyplugin_producer_video.h \
    $$PWD/../mp_recaptcha.h \
    $$PWD/../mp_session.h \
    $$PWD/../mp_session_av.h \
    $$PWD/../mp_wrap.h

SOURCES += \
    $$PWD/../mp_c2c.cc \
    $$PWD/../mp_engine.cc \
    $$PWD/../mp_mail.cc \
    $$PWD/../mp_mutex.cc \
    $$PWD/../mp_net_transport.cc \
    $$PWD/../mp_object.cc \
    $$PWD/../mp_peer.cc \
    $$PWD/../mp_proxyplugin.cc \
    $$PWD/../mp_proxyplugin_consumer_audio.cc \
    $$PWD/../mp_proxyplugin_consumer_video.cc \
    $$PWD/../mp_proxyplugin_mgr.cc \
    $$PWD/../mp_proxyplugin_producer_audio.cc \
    $$PWD/../mp_proxyplugin_producer_video.cc \
    $$PWD/../mp_recaptcha.cc \
    $$PWD/../mp_session.cc \
    $$PWD/../mp_session_av.cc \
    $$PWD/../mp_wrap.cc
