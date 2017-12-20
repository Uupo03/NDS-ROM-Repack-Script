@echo OFF
if not exist "current.nds" ECHO Error, no current.nds, close this window
if not exist "current.nds" pause >nul
if exist "repacked.nds" ECHO !WARNING! Pressing any key will OVERWRITE the repcked.nds in this directory. !WARNING!
if exist "repacked.nds" pause >nul
ECHO Unpacking...
mkdir NDS_UNPACK
rd /Q /S NDS_UNPACK
mkdir NDS_UNPACK
>nul 2>nul ndstool -v -x current.nds -9 NDS_UNPACK/arm9.bin -7 NDS_UNPACK/arm7.bin -y9 NDS_UNPACK/y9.bin -y7 NDS_UNPACK/y7.bin -d NDS_UNPACK/data -y NDS_UNPACK/overlay -t NDS_UNPACK/banner.bin -h NDS_UNPACK/header.bin 
ECHO Repacking...
>nul ndstool -c repacked.nds -9 NDS_UNPACK/arm9.bin -7 NDS_UNPACK/arm7.bin -y9 NDS_UNPACK/y9.bin -y7 NDS_UNPACK/y7.bin -d NDS_UNPACK/data -y NDS_UNPACK/overlay -t NDS_UNPACK/banner.bin -h NDS_UNPACK/header.bin 
@RD /S /Q NDS_UNPACK
ECHO DONE! (You can close this window now.)
pause >nul