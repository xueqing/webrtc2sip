# FAQ

- [FAQ](#faq)
  - [How to report issue](#how-to-report-issue)
  - [How to create self-signed SSL certificates](#how-to-create-self-signed-ssl-certificates)
  - [How to redirect the output to a file](#how-to-redirect-the-output-to-a-file)
  - [I see "Remote party requesting DTLS-DTLS (UDP/TLS/RTP/SAVPF) but this option is not enabled". How can I fix this](#i-see-%22remote-party-requesting-dtls-dtls-udptlsrtpsavpf-but-this-option-is-not-enabled%22-how-can-i-fix-this)
  - [I see "Too many open files" error when I try to connect a client. How can I fix this](#i-see-%22too-many-open-files%22-error-when-i-try-to-connect-a-client-how-can-i-fix-this)
  - [I see "a=crypto in RTP/AVP, refer to RFC 3711" on my console when calling FreeSWITCH. How can I fix this](#i-see-%22acrypto-in-rtpavp-refer-to-rfc-3711%22-on-my-console-when-calling-freeswitch-how-can-i-fix-this)
  - [Why do I have delay on H.264 stream from webrtc2sip](#why-do-i-have-delay-on-h264-stream-from-webrtc2sip)

## How to report issue

We receive tens of messages on our dev-groups and private mailboxes every day. Without a commercial license, we only provide a best-effort support on [doubango-discuss](https://groups.google.com/forum/#!forum/doubango).
**We're happy to help you to fix your issues** but we'll not spend hours on them to understand what's wrong. If you want help, you **must**:

- Provide clear technical description of the issue.
- Change you _config.xml_ to use INFO debug level.
- Attach the logs to the message (**do not cut the logs**).
- Provide information about the SVN revisions (both Doubango and webrtc2sip).

If the report is about building issues:

- Attach _config.log_ files for both Doubango and webrtc2sip

you _should_ also:

- Provide the network (Wireshark) capture at the server-side
- Provide the browser logs.

## How to create self-signed SSL certificates

We'd recommend reading [this thread](https://groups.google.com/forum/#!topic/doubango/asAfP5ZCgdI).

## How to redirect the output to a file

webrtc2sip logs the messages to **sdterr** and **stdout**. To redirect the logs to webrtc2sip.log:

```sh
webrtc2sip >webrtc2sip.log 2>&1
```

## I see "Remote party requesting DTLS-DTLS (UDP/TLS/RTP/SAVPF) but this option is not enabled". How can I fix this

DTLS-SRTP is required by some WebRTC implementations (e.g. Firefox). You **MUST**:

1. use a new OpenSSL version with support for DTLS-SRTP as explained [here](Building_Source_v2_0.md#Building_OpenSSL). Linux almost always comes with OpenSSL pre-installed which means building and installing OpenSSL by yourself will most likely duplicate it.
2. make sure you don't have more than one OpenSSL version installed (look for libssl).
3. rebuild webrtc2sip and make sure the "CONGRATULATIONS" message says that you have DTLS-SRTP enabled.
4. make sure you're using SSL certificates in your _config.xml_ (see [technical documentation](http://webrtc2sip.org/technical-guide-1.0.pdf) ). DTLS-SRTP requires at least a valid Public Key (could be self signed).

## I see "Too many open files" error when I try to connect a client. How can I fix this

If you're using webrtc2sip **2.5.1** or previous:
On CentOS, Fedora, Redhat and many other Linux ditros the number of sockets an application could open is limited to **1024**. To check your limit:

```sh
ulimit -n
```

For example, to change this limit (**You must be carefully**) to **2048**:

```sh
ulimit -n 2048
# then restart webrtc2sip
```

If you're using webrtc2sip **2.6.0** or later:
Change **max-fds** entry in **config.xml**.

## I see "a=crypto in RTP/AVP, refer to RFC 3711" on my console when calling FreeSWITCH. How can I fix this

~~Edit the config.xml file and change the **srtp-mode** from _optional_ to _mandatory_.~~
Starting version [2.1.0](http://code.google.com/p/webrtc2sip/wiki/ReleaseNotes#2.1.0), it's no longer required to change config.xml.

## Why do I have delay on H.264 stream from webrtc2sip

~~When the media coder module is enabled we use FFmpeg and libx264 to encode the stream. libx264 uses presets to define some default configuration parameters. Setting these presets from FFmpeg wrapper seems to be useless as the values are never forwarded to libx264. To fix this issue, you need to apply the patch at <http://code.google.com/p/doubango/source/browse/branches/2.0/doubango/thirdparties/patches/ffmpeg_libx264_git.patch> ~~
Starting Doubango 873, it's no longer required to patch FFmpeg