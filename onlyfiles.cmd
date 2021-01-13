@echo off
title OnlyFiles
cls
echo Copy only the files from a directory and its subdirectories to a destination directory.
echo.

:set_source
set /p source=Enter SOURCE directory:
if /I %source%==exit exit
if exist %source% (  
goto set_dest
) else (
echo Source directory could not be found. Please try again.
goto set_source
)

:set_dest
set /p dest=Enter DESTINATION directory:
if /I %dest%==exit exit
if exist %dest% (  
goto do_copy
) else (
echo Destination directory could not be found. Please try again.
goto set_dest
)

:do_copy
cd %source%
for /r %%d in (*) do copy "%%d" "%dest%"
echo.
echo Operation completed. Press any key to exit.
pause >nul
