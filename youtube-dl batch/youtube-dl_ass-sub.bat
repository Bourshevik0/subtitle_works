@echo off
set in_format=*.vtt
set out_format=.ass
set video_url=

@echo on
youtube-dl --all-subs --write-sub --write-description --write-thumbnail --proxy 127.0.0.1:1080 %video_url% -o "%%(title)s-%%(uploader)s-%%(upload_date)s-%%(id)s.%%(ext)s"

for /f "delims=^" %%i in ('dir /b %in_format%') do (
    ffmpeg -i "%%i" "%%~ni%out_format%"
)

call cmd