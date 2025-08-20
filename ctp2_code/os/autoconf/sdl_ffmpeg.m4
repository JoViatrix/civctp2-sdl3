dnl
dnl $Id$
dnl

dnl AC_DEFUN([AM_PATH_SDL_FFMPEG],[
dnl    AC_CHECK_HEADER([libavcodec/avcodec.h],[av_codec_found_header=yes],[av_codec_found_header=no])
dnl    AC_CHECK_HEADER([libavformat/avformat.h],[av_format_found_header=yes],[av_format_found_header=no])
dnl    AC_CHECK_HEADER([libswscale/swscale.h],[sw_scale_found_header=yes],[sw_scale_found_header=no])
dnl    if test "x$av_codec_found_header" = xyes -a "x$av_format_found_header" = xyes -a "x$sw_scale_found_header" = xyes; then
dnl        SDL_FFMPEG_LDFLAGS="-lavutil -lavformat -lavcodec -lswscale -lswresample"
dnl        AC_DEFINE(USE_SDL_FFMPEG,1,[Enable SDL_ffmpeg library])
dnl    else
dnl        SDL_FFMPEG_LDFLAGS=""
dnl    fi
dnl 
dnl    AC_SUBST(SDL_FFMPEG_LDFLAGS)
dnl ])

AC_DEFUN([AM_PATH_SDL_FFMPEG],[
   PKG_CHECK_MODULES([FFMPEG], [libavcodec libavformat libswscale], [
       CPPFLAGS="$CPPFLAGS $FFMPEG_CFLAGS"
       SDL_FFMPEG_LDFLAGS="$FFMPEG_LIBS"
       AC_DEFINE(USE_SDL_FFMPEG,1,[Enable SDL_ffmpeg library])
   ], [
       SDL_FFMPEG_LDFLAGS=""
       AC_MSG_WARN([FFmpeg not found — SDL_FFMPEG support disabled])
   ])
   AC_SUBST(SDL_FFMPEG_LDFLAGS)
])