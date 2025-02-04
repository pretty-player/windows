rem https://github.com/pretty-player
@echo off
set arg1=%1
set arg2=%2

ipconfig | findstr /I "ipv4" > temp.txt
set /P ipaddr=<temp.txt

echo "Starting requests........."


FOR /L %%b IN (%arg1%,1,%arg2%) DO (ping -n 2 %ipaddr:~-16,13%"%%b")

del temp.txt