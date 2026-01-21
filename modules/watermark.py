import subprocess

def add_moving_watermark(input_video, output_video):
    cmd = [
        "ffmpeg", "-y",
        "-i", input_video,
        "-vf",
        "drawtext="
        "fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:"
        "text='@Sumit_Zx':"
        "fontcolor=white@0.5:"
        "fontsize=24:"
        "shadowcolor=black:"
        "shadowx=2:shadowy=2:"
        "x=w-mod(t*100\\,w+tw):"
        "y=h-40",
        "-c:a", "copy",
        output_video
    ]
    subprocess.run(cmd, check=True)
