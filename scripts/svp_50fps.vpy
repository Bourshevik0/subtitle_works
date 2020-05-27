import vapoursynth as vs
import mvsfunc as mvf

core = vs.get_core()

# 把这俩 DLL 拷贝到 VapourSynth\plugins64 先
# core.std.LoadPlugin("libsvpflow1_vs64.so")
# core.std.LoadPlugin("libsvpflow2_vs64.so")

svp_frame_num = 50
svp_frame_den = 1

sourcename_0 = ""

# source_0 open
clip = core.lsmas.LWLibavSource(source=sourcename_0, format="yuv420p8")

# 运动向量精度 0.5 像素
# 使用 GPU 渲染
# 放大使用 Wiener interpolation(类似 Lanczos 6tap)
# 缩小使用类似 BicubicResize(b=1,c=0) 的 cubic filter
super = core.svp1.Super(clip, "{scale:{up:2, down:4}, pel:2, gpu:1}")
# 使用 GPU 渲染
# 搜索的运动矢量的方向时包含前向后向
# 搜索的块大小 = 32x32 每个方向重叠四分之一个块
# 精细搜索使用彻底搜索
# 粗略搜索使用六边形搜索
vectors = core.svp1.Analyse(super["clip"], super["data"], clip,
                            "{gpu:1, vectors:3, block:{w:32, overlap:3}, main:{type:4, search:{coarse:{type:2, distance:-6, bad:{sad:2000, range:24}}}}, refine:[{thsad:250}]}")
# 渲染算法 =
#    时间加权之下混合前向和后向部分运动向量补偿 +
#    额外的遮罩减小光晕提升物体边缘线条质量 +
#    额外的运动向量进一步减少光晕
# 帧插补 = 自动判断
smooth = core.svp2.SmoothFps(clip, super["clip"], super["data"], vectors["clip"], vectors["data"],
                             "{{gpuid:0, rate:{{num:{sfn}, den:{sfd}, abs:true}}, algo:2, mask:{{area:200}}, scene:{{mode:3}}}}".format(sfn=svp_frame_num, sfd=svp_frame_den))

smooth = core.std.AssumeFPS(
    smooth, fpsnum=smooth.fps_num, fpsden=smooth.fps_den)

smooth = mvf.Depth(smooth, depth=10)
ass_out = core.vsfm.TextSubMod(clip=smooth, file=r"E:\temp\temp.ass")
ass_out = mvf.Depth(ass_out, depth=8)
ass_out.set_output()
