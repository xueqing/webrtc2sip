# webrtc2sip

Source code freely provided to you by [Doubango Telecom ®](https://doubango.org).
This is part of [sipML5](http://code.google.com/p/sipml5/) solution and don't hesitate to test our [live demo](http://sipml5.org/).

**webrtc2sip** is a smart and powerful gateway using [RTCWeb](http://en.wikipedia.org/wiki/WebRTC) and SIP to turn your browser into a phone with audio, video and SMS capabilities. The gateway allows your web browser to make and receive calls from/to any SIP-legacy network or PSTN.

As an example, you will be able to make a call from your preferred web browser to a SIP-legacy softphone (e.g. [xlite](http://www.counterpath.com/x-lite.html)) or mobile/fixed phone.

The gateway contains four modules: [SIP Proxy](#SIP_Proxy.md) | [RTCWeb Breaker](#RTCWeb_Breaker.md) | [Media Coder](#Media_Coder.md) | [Click-to-Call service](#Click-to-Call_service.md)..

![documentation/images/architecture.png](documentation/images/architecture.png)
_Global architecture_

## SIP Proxy

The role of the SIP Proxy module is to convert the SIP transport from WebSocket protocol to **UDP**, **TCP** or **TLS** which are supported by all legacy networks. If your provider or hosted server supports SIP over **WebSocket** (e.g. Asterisk or Kamailio) then, you can bypass the module and connect the client directly to the endpoint.
Bypassing the SIP Proxy is not recommended if you’re planning to use the RTCWeb Breaker or Media Coder modules as this will requires maintaining two different connections.

There are no special requirements for the end server to be able to talk to the Proxy module.

![documentation/images/module_sipproxy.png](documentation/images/module_sipproxy.png)
_SIP Proxy architecture_

## RTCWeb Breaker

The RTCWeb specifications make support for **ICE** and **DTLS/SRTP** mandatory. The problem is that many SIP-legacy endpoints (e.g. PSTN network) do not support these features.
It’s up to the RTCWeb Breaker to negotiate and convert the media stream to allow these two worlds to interop.

We highly recommend checking the [Technical Guide](http://webrtc2sip.org/technical-guide-1.0.pdf) to understand how to avoid **security issues** when using this module.
For example, **FreeSWITCH** do not support **ICE** which means it requires the RTCWeb Breaker in order to be able to connect the browser to a SIP-legacy endpoint.

![http://webrtc2sip.googlecode.com/svn/trunk/documentation/images/module_rtcwebbreaker.png](documentation/images/module_rtcwebbreaker.png)
_RTCWeb Breaker architecture_

## Media Coder

The RTCWeb standard defined two MTI (Mandatory To Implement) audio codecs: **opus** and **g.711**.

For now there are intense discussions about the MTI video codecs. The choice is between **VP8** and **H.264**. VP8 is royalty-free but not widely deployed while H.264 AVC is not free but widely deployed.
Google has decided to use **VP8** in Chrome while Ericsson uses **H.264 AVC** in [Bowser](https://labs.ericsson.com/apps/bowser). Mozilla and Opera Software will probably use VP8 and Microsoft H.264 AVC. As an example, the Media Coder will allow to make video calls between Chrome and Bowser.
Another example is calling a Telepresence system (e.g. Cisco) which most likely uses **H.264 SVC** from Chrome.

![documentation/images/module_mediacoder.png](documentation/images/module_mediacoder.png)
_Media Coder architecture_

## Click-to-Call service

This is a complete SIP [click-to-call](http://en.wikipedia.org/wiki/Click-to-call) solution based on the three other components. The goal is to allow any person receiving your mails, visiting your website, reading your twitts, watching your Facebook/Google+ profile to call you on your mobile phone with a single click. As an example, click [here](http://click2dial.org/u/ZGlvcG1hbWFkb3VAZG91YmFuZ28ub3Jn) to call me on my mobile phone.

For more information: <http://click2dial.org>

![documentation/images/module_click-to-call.png](documentation/images/module_click-to-call.png)
_Click-to-Call Components_

## Testing the gateway

Let's say the webrtc2sip gateway and SIP server are running on two different PCs with IP addresses equal to _192.168.0.1_ and _192.168.0.2_ respectively.

  1. Open [http://sipml5.org/expert.htm](http://sipml5.org/expert.htm) in your browser
  2. Fill _“WebSocket Server URL”_ field with the IP address and port where your webrtc2sip gateway is listening for incoming Websocket connections (e.g _ws://192.168.0.1:10060_ or _wss://192.168.0.1:10062_). **IMPORTANT:** Do not forget the url scheme (**ws://** or **wss://**).
  3. The _“SIP outbound Proxy URL”_ is used to set the destination IP address and Port to use for all outgoing requests regardless the domain name (a.k.a realm). This is a good option for developers using a SIP domain name without valid DNS A/NAPTR/SRV records. E.g. _udp://192.168.0.2:5060_.
  4. Check _“Enable RTCWeb Breaker”_ if you want to call a SIP-legacy endpoint.

## Security Issues

We highly recommend checking the [Technical Guide](http://webrtc2sip.org/technical-guide-1.0.pdf) to understand how to avoid **security issues** when using our gateway.

## Technical help

Please check our [issue tracker](https://github.com/DoubangoTelecom/webrtc2sip/issues), [developer group](https://groups.google.com/group/doubango) and [technical guide](http://webrtc2sip.org/technical-guide-1.0.pdf) if you have any problem.

**© 2012-2015 [Doubango Telecom](https://doubango.org)**
_Inspiring the future_
