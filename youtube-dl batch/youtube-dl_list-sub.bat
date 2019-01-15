@echo off
set video_url=
@echo on
youtube-dl --list-subs --proxy 127.0.0.1:1080 %video_url%
call cmd