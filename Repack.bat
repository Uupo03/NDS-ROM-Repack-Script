@echo OFF

ECHO /\~~~~~~~~~~=--NDS ROM Repack Script by Uupo03--=~~~~~~~~~~/\

if not exist "*.nds" ECHO !Error! No nds ROM to repack, press any key to close this window. 2>nul
if not exist "*.nds" pause >nul 2>nul
if not exist "*.nds" exit >nul 2>nul
if not exist "repacked.nds" goto :script >nul 2>nul
 
:choice
set /P c=!Error! A "repacked.nds" already exists in this directory, do you want to delete it?[Y/N]?
if /I "%c%" EQU "Y" goto :choice_yes
if /I "%c%" EQU "N" goto :choice_no
goto :choice

:choice_yes

echo Deleteing repacked.nds
DEL repacked.nds
echo DONE! Press any key to continue.
pause >nul 2>nul
goto :script >nul 2>nul

:choice_no

echo Press any key to close this window.
pause >nul 2>nul
exit >nul 2>nul

)
:script

if not exist "*.nds" ECHO !Error! No nds ROM to repack, press any key to close this window. 2>nul
if not exist "*.nds" pause >nul 2>nul
if not exist "*.nds" exit >nul 2>nul

if exist "repacked.nds" pause >nul 2>nul
if exist "repacked.nds" exit >nul2>nul

ECHO Unpacking...
@RD /S /Q NDS_UNPACK 2>nul
mkdir NDS_UNPACK
rd /Q /S NDS_UNPACK 2>nul
mkdir NDS_UNPACK
>nul 2>nul ndstool -v -x *.nds -9 NDS_UNPACK/arm9.bin -7 NDS_UNPACK/arm7.bin -y9 NDS_UNPACK/y9.bin -y7 NDS_UNPACK/y7.bin -d NDS_UNPACK/data -y NDS_UNPACK/overlay -t NDS_UNPACK/banner.bin -h NDS_UNPACK/header.bin 

ECHO Repacking...
>nul 2>nul ndstool -c repacked.nds -9 NDS_UNPACK/arm9.bin -7 NDS_UNPACK/arm7.bin -y9 NDS_UNPACK/y9.bin -y7 NDS_UNPACK/y7.bin -d NDS_UNPACK/data -y NDS_UNPACK/overlay -t NDS_UNPACK/banner.bin -h NDS_UNPACK/header.bin 
@RD /S /Q NDS_UNPACK
ECHO DONE! Press any key to close this window.
pause >nul