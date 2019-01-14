@echo off
set in_format=*.vtt
set out_format=.srt

@echo on
for /f "delims=^" %%i in ('dir /b %in_format%') do (
    ffmpeg -i "%%i" "%%~ni%out_format%"
)

call cmd