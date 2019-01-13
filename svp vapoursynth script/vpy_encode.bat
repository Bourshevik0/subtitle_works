@echo off
set vspipe="C:\Program Files (x86)\VapourSynth\core64\vspipe.exe"
set vpy_dir=""
set encoder_dir="C:\userfile\Desktop\压制\小丸工具箱236\tools\x264_64-8bit.exe"
set output_dir=""
set log_dir="%date:~0,4%_%date:~5,2%_%date:~8,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%.log"

@echo on
%vspipe% --y4m %vpy_dir% - | %encoder_dir% --demuxer y4m --tune animation --qcomp 0.6 --min-keyint 1 --profile high --level 5.1 --preset 8 --scenecut 60 --aq-mode 2 --aq-strength 0.7 --ref 12 --crf 22 --colormatrix bt709 -o %output_dir% - 2>>%log_dir%
pause