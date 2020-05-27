set "filename="
ffmpeg -i "%filename%" -filter:v  "setpts=0.25*PTS" -r 60 -filter:a "atempo=4.0" -c:v libx264 -tune film -preset veryslow -crf 22 -x264-params qcomp=0.6:min-keyint=1:level=5.1:scenecut=60:aq-mode=2:aq-strength=0.7:ref=12:colormatrix=bt709 "%filename:~0,-4%.out.mp4"
pause
