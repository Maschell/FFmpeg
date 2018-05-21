#!/bin/bash

# Taken from https://github.com/hrydgard/ppsspp-ffmpeg/blob/master/wiiu.sh

set -e

GENERAL="\
   --enable-cross-compile \
   --arch=powerpc \
   --cpu=750 \
   --cc=powerpc-eabi-gcc \
   --cross-prefix=powerpc-eabi- \
   --nm=powerpc-eabi-nm"

MODULES="\
   --disable-avdevice \
   --disable-filters \
   --disable-programs \
   --disable-network \
   --disable-avfilter \
   --disable-postproc \
   --disable-encoders \
   --disable-protocols \
   --disable-hwaccels \
   --disable-doc"

VIDEO_DECODERS="\
   --enable-decoder=h264 \
   --enable-decoder=mpeg4 \
   --enable-decoder=mpeg2video \
   --enable-decoder=mjpeg \
   --enable-decoder=mjpegb"

AUDIO_DECODERS="\
    --enable-decoder=aac \
    --enable-decoder=aac_latm \
    --enable-decoder=atrac3 \
    --enable-decoder=atrac3p \
    --enable-decoder=mp3 \
    --enable-decoder=pcm_s16le \
    --enable-decoder=pcm_s8"
  
DEMUXERS="\
    --enable-demuxer=h264 \
    --enable-demuxer=m4v \
    --enable-demuxer=mpegvideo \
    --enable-demuxer=mpegps \
    --enable-demuxer=mp3 \
    --enable-demuxer=avi \
    --enable-demuxer=aac \
    --enable-demuxer=pmp \
    --enable-demuxer=oma \
    --enable-demuxer=pcm_s16le \
    --enable-demuxer=pcm_s8 \
    --enable-demuxer=wav"

VIDEO_ENCODERS="\
	  --enable-encoder=huffyuv \
	  --enable-encoder=libx264 \
	  --enable-encoder=ffv1 \
	  --enable-encoder=mjpeg"

AUDIO_ENCODERS="\
	  --enable-encoder=pcm_s16le"

MUXERS="\
  	  --enable-muxer=avi"


PARSERS="\
    --enable-parser=h264 \
    --enable-parser=mpeg4video \
    --enable-parser=mpegaudio \
    --enable-parser=mpegvideo \
    --enable-parser=aac \
    --enable-parser=aac_latm"


function build_WUP
{
echo "Setting up ffmpeg"
./configure --target-os=linux \
    --prefix=./wiiu \
    ${GENERAL} \
    --enable-gpl \
    --enable-libx264 \
    --disable-shared \
    --enable-static \
    --extra-ldflags="-L./external/x264/build_WUP/lib" \
    --extra-libs="-lx264" \
    --extra-cflags="-Os -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing -finline-limit=300 -mwup -mcpu=750 -meabi -mhard-float -U__INT32_TYPE__ -U__UINT32_TYPE__ -D__INT32_TYPE__=int -I./external/x264/build_WUP/include" \
    --disable-everything \
    ${MODULES} \
    ${VIDEO_DECODERS} \
    ${AUDIO_DECODERS} \
    ${VIDEO_ENCODERS} \
    ${AUDIO_ENCODERS} \
    ${DEMUXERS} \
    ${MUXERS} \
    ${PARSERS}

make clean
echo "Compiling ffmpeg"
make -j8 install
}

build_WUP
echo WiiU build finished
