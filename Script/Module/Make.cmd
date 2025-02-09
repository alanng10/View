@echo off

call Script\Module\MakeModule Draw.Draw
call Script\Module\MakeModule View.Infra
call Script\Module\MakeModule View.View
call Script\Module\MakeModule Type.Type
call Script\Module\MakeModule Frame.Frame
call Script\Module\MakeModule Media.Play

call Script\Module\MakeModule ViewDemo