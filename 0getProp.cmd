@echo off
if "" EQU "%1" (
adb shell getprop ro.product.model
adb shell getprop ro.build.flavor
adb shell getprop ro.bootimage.build.date
adb shell getprop ro.build.changelist
adb shell getprop ro.product.board
adb shell getprop service.secureui.screeninfo
adb shell getprop ro.build.description
adb shell getprop ro.board.platform

)else (
adb shell getprop | find "%1"
)
