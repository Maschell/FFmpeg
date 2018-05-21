# FFmpeg for Wii U, based on version 4.0

The github repo is broken for some reason. The `wiiu.sh` is only working when using the official download `https://ffmpeg.org/releases/ffmpeg-4.0.tar.bz2`. 
Even hosting exactly these file on a new repo doesn't work after a fresh checkout.  
The current approach would be downloading the link mentioned above, and cloning the `x264` repo manually if needed (https://github.com/Maschell/x264/tree/wiiu) into `/external`. 
Then build ``x264` manually. When x264 is built, the current `wiiu.sh` should be compatible. Copy paste it from this repo.

This branch is used to compile FFmpeg for the Wii U, make sure to init the submodules.  
Modify the `wiiu.sh` to specify the codecs etc., then simply run the `wiiu.sh` script.
You need your devkitPPC binaries ('devkitPro\devkitPPC\bin') in your 'PATH' variable.  
The compiled libraries will be saved in `./wiiu`, copy the result to `devkitPro\portlibs\ppc` manually.

========================================================


FFmpeg README
=============

FFmpeg is a collection of libraries and tools to process multimedia content
such as audio, video, subtitles and related metadata.

## Libraries

* `libavcodec` provides implementation of a wider range of codecs.
* `libavformat` implements streaming protocols, container formats and basic I/O access.
* `libavutil` includes hashers, decompressors and miscellaneous utility functions.
* `libavfilter` provides a mean to alter decoded Audio and Video through chain of filters.
* `libavdevice` provides an abstraction to access capture and playback devices.
* `libswresample` implements audio mixing and resampling routines.
* `libswscale` implements color conversion and scaling routines.

## Tools

* [ffmpeg](https://ffmpeg.org/ffmpeg.html) is a command line toolbox to
  manipulate, convert and stream multimedia content.
* [ffplay](https://ffmpeg.org/ffplay.html) is a minimalistic multimedia player.
* [ffprobe](https://ffmpeg.org/ffprobe.html) is a simple analysis tool to inspect
  multimedia content.
* Additional small tools such as `aviocat`, `ismindex` and `qt-faststart`.

## Documentation

The offline documentation is available in the **doc/** directory.

The online documentation is available in the main [website](https://ffmpeg.org)
and in the [wiki](https://trac.ffmpeg.org).

### Examples

Coding examples are available in the **doc/examples** directory.

## License

FFmpeg codebase is mainly LGPL-licensed with optional components licensed under
GPL. Please refer to the LICENSE file for detailed information.

## Contributing

Patches should be submitted to the ffmpeg-devel mailing list using
`git format-patch` or `git send-email`. Github pull requests should be
avoided because they are not part of our review process and will be ignored.
