@echo off

set Module=%~1
set ClassOutFold=..\Class\Out\Class

rmdir /S /Q %ClassOutFold%\View.%Module%.data 2>NUL
del /F /Q %ClassOutFold%\View.%Module%.* 2>NUL