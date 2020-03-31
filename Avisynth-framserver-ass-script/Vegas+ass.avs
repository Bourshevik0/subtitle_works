plugin_source_name = "C:\userfile\Desktop\压制\小丸工具箱236\tools\avs\plugins\VSFilter.DLL"
video_source_name = "C:\userfile\Video\xxx.avi"
ass_source_name = "E:\temp\temp.ass"

LoadPlugin(plugin_source_name)
AVISource(video_source_name)
ConvertToYV12(matrix = "Rec709")
textsub(ass_source_name)

无字幕
video_source_name = "C:\userfile\Video\xxx.avi"
AVISource(video_source_name)
ConvertToYV12(matrix = "Rec709")