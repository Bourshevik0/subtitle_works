@echo off
set video_url=
@echo on
youtube-dl --write-auto-sub --sub-lang en --write-description --write-thumbnail --proxy 127.0.0.1:1080 %video_url% -o "%%(title)s-%%(uploader)s-%%(upload_date)s-%%(id)s.%%(ext)s"
call cmd