@echo off
set fileName=demo.mp4
echo Recording
adb shell screenrecord  --time-limit 10 /sdcard/%fileName%
rem ������Ƶ¼��ʱ��Ϊ10s����������ƣ�Ĭ��180s
echo recoord done, start pulling
adb pull /sdcard/%fileName%
echo pulling done
dir %fileName%

goto :eof

Usage: screenrecord [options] <filename>
Records the device's display to a .mp4 file.
Options:
--size WIDTHxHEIGHT
    Set the video size, e.g. "1280x720".  Default is the device's main
    display resolution (if supported), 1280x720 if not.  For best results,
    use a size supported by the AVC encoder.
--bit-rate RATE
    Set the video bit rate, in megabits per second.  Default 4Mbps.
--time-limit TIME
    Set the maximum recording time, in seconds.  Default / maximum is 180.
--rotate
    Rotate the output 90 degrees.
--verbose
    Display interesting information on stdout.
--help
    Show this message.
Recording continues until Ctrl-C is hit or the time limit is reached.