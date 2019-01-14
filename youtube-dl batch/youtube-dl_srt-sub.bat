@echo off
set video_url=
@echo on
youtube-dl --all-subs --write-sub --convert-subs srt --write-description --write-thumbnail --proxy 127.0.0.1:1080 %video_url% -o "%%(title)s-%%(uploader)s-%%(upload_date)s-%%(id)s.%%(ext)s"
pause