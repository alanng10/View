@echo off

set ClassFold=..\Class\Out\Class

pushd %ClassFold%
View.Demo-0.00.00
echo Status: %errorlevel%
popd