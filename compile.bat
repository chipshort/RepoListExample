@echo off
haxe build/build.hxml -neko bin/main.n
haxe build/build.hxml -js bin/Main.js

REM -swf-version 10.1
REM -swf bin/index.swf
pause