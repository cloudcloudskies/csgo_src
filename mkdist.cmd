@echo off

set "game_dir=..\..\..\game"
set "target_dir=c:\rtest"

if exist "%target_dir%" rd /s /q "%target_dir%"
md "%target_dir%"
md "%target_dir%\bin"
md "%target_dir%\source2"

xcopy /s "%game_dir%\source2" "%target_dir%\source2"
copy "%game_dir%\bin\rendersystemtest.exe" "%target_dir%"

copy runbenchmarks.cmd "%target_dir%"
copy macrun.sh "%target_dir%"
copy readme.txt "%target_dir%"

for %%f in (inputsystem worldrenderer filesystem_stdio) do copy "%game_dir%\bin\%%f.dll" "%target_dir%\bin"

xcopy "%game_dir%\bin\rendersystem*.dll" "%target_dir%\bin"
xcopy "%game_dir%\bin\*.dylib" "%target_dir%\bin"

md "%target_dir%\bin\rendersystemtest.app"
xcopy /s "%game_dir%\bin\rendersystemtest.app\*" "%target_dir%\bin\rendersystemtest.app"

for %%f in (tier0 vstdlib) do copy "%game_dir%\bin\%%f.dll" "%target_dir%\bin"

..\..\pkzip25 -add -dir=relative "%target_dir%\rtest.zip" "%target_dir%\*.*"
