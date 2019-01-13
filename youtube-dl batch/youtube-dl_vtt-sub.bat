@echo off
set video_url=https://www.youtube.com/watch?v=89GtOJABVS4
@echo on
youtube-dl.exe --sub-lang en --write-sub --write-description --write-thumbnail --proxy 127.0.0.1:1080 %video_url% -o "%%(title)s-%%(uploader)s-%%(upload_date)s-%%(id)s.%%(ext)s"
pause