@echo off

ren *(1).jpg *(01).jpg
ren *(2).jpg *(02).jpg
ren *(3).jpg *(03).jpg
ren *(4).jpg *(04).jpg
ren *(5).jpg *(05).jpg
ren *(6).jpg *(06).jpg
ren *(7).jpg *(07).jpg
ren *(8).jpg *(08).jpg
ren *(9).jpg *(09).jpg

echo Files renamed successfully!

setlocal enabledelayedexpansion

set "output_file=output.txt"
set "folder_path=."

rem Remove old output file if it exists
if exist %output_file% del %output_file%

set "counter=1"

for /r "%folder_path%" %%i in (*.jpg) do (
    set "file=%%~nxi"
    set "relative_path=.\PhotoGallery\%%~nxi"
    set "alt_text=Photo !counter!"
    echo ^<img class="photo" src="!relative_path!" alt="!alt_text!"^> >> %output_file%
 
    set /a counter+=1
)

echo File list written to %output_file%
