Introduction

srt-live-server(SLS) is an open source live streaming server for low latency based on Secure Reliable Tranport(SRT).
Normally, the latency of transport by SLS is less than 1 second in internet.


Requirements

please install the SRT first, refer to SRT(https://github.com/Haivision/srt) for system enviroment.
SLS can only run on OS based on linux, such as mac, centos or ubuntu etc.

Complie

$ sudo make

bin file is generated in subdir of 'bin'.


Usage

$ cd bin

1.help information
$ ./sls -h

2.run with default config file
$ ./sls -c ../sls.conf

Test

SLS only supports the MPEG-TS format streaming. you can push camera live stream by FFMPEG.Please download ffmpeg sourcecode from https://github.com/FFmpeg/FFmpeg, then compile FFMPEG with --enable-libsrt. 

1.use ffmpeg to push camera stream with SRT(on my mac):
$ ./ffmpeg -f avfoundation -framerate 30 -i "0:0" -vcodec libx264  -preset ultrafast -tune zerolatency -flags2 local_header  -acodec libmp3lame -g  30 -pkt_size 1316 -flush_packets 0 -f mpegts "srt://[your.sls.ip]:8080?streamid=uplive.sls.com/uplive/test"

2.play the SRT stream with ffplay:
./ffplay -fflag nobuffer -i "srt://[your.sls.ip]:8080?streamid=live.sls.com/live/test"

Note:

1.SLS refer to the RTMP url format(domain/app/stream_name), example: www.sls.com/live/test. The url of SLS must be set in streamid parameter of SRT, which will be the unique identification a stream.
2.How to distinguish the publisher and player of the same stream? In conf file, you can set parameters of domain_player/domain_publisher and app_player/app_publisher to resolve it. Importantly, the two combination strings of domain_publisher/app_publisher and domain_player/app_player must not be equal in the same server block.

