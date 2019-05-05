QT -= core gui

TARGET = tinywrap
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

CI-TEST{
    target.path = $$(INSTALL_PATH)/ci-test/commonlib
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

HEADERS += \
    ActionConfig.h \
    AudioResampler.h \
    Common.h \
    DDebug.h \
    MediaContent.h \
    MediaSessionMgr.h \
    Msrp.h \
    ProxyConsumer.h \
    ProxyPluginMgr.h \
    ProxyProducer.h \
    SafeObject.h \
    SipCallback.h \
    SipEvent.h \
    SipMessage.h \
    SipSession.h \
    SipStack.h \
    SipUri.h \
    SMSEncoder.h \
    tinyWRAP_config.h \
    Xcap.h

SOURCES += \
    ActionConfig.cxx \
    AudioResampler.cxx \
    DDebug.cxx \
    MediaContent.cxx \
    MediaSessionMgr.cxx \
    Msrp.cxx \
    ProxyConsumer.cxx \
    ProxyPluginMgr.cxx \
    ProxyProducer.cxx \
    SafeObject.cxx \
    SipCallback.cxx \
    SipEvent.cxx \
    SipMessage.cxx \
    SipSession.cxx \
    SipStack.cxx \
    SipUri.cxx \
    SMSEncoder.cxx \
    Xcap.cxx
