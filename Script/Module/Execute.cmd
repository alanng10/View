@echo off

set ClassFold=..\Class\Out\Class

pushd %ClassFold%
class ViewDemo-0.00.00
echo Status: %errorlevel%
popd