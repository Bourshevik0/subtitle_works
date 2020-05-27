plugin_source_name = "VSFilter.dll"
video_source_name = ""
ass_source_name = ""

LoadPlugin(plugin_source_name)
AVISource(video_source_name)
ConvertToYV12(matrix = "Rec709")
textsub(ass_source_name)
