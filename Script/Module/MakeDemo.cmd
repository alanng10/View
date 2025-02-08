@echo off

set DotNetOutFold=..\Class\Out\net8.0

echo Make Demo
pushd %DotNetOutFold%
saber make ../../../View/Module/Demo
echo Status: %errorlevel%
popd