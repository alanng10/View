@echo off

call Script\Module\CleanModule Type
call Script\Module\CleanModule Draw
call Script\Module\CleanModule Frame

call Script\Module\MakeModule Type
call Script\Module\MakeModule Draw
call Script\Module\MakeModule Frame