@echo off
color 1E
@cd /d "%~dp0drivers"
setlocal ENABLEDELAYEDEXPANSION
:continue
cls
echo                       Written by TinToSer(https://github.com/tintoser)
echo:
echo:
echo ====A Software by https://www.amyuni.com/ to add Virtual Monitors to your Computer====
REM ====================DO NOT CHANGE ANYTHING==========================

echo:
echo ============Select the number below to Install/Configure Virtual Display==============
echo:

echo [1] Install Virtual Screen Driver
echo [2] Uninstall Virtual Screen Driver
echo [3] Create Virtual Screen(Max 4 displays)
echo [4] Remove Virtual Screen
echo [5] To Exit
echo [6] Help

set /p userc=Enter your choice(index):-
echo:
echo:
if 1== %userc% (
    goto %PROCESSOR_ARCHITECTURE%
    goto repeat
    :AMD64
    deviceinstaller64.exe install usbmmidd.inf usbmmidd
    goto end
    :x86
    deviceinstaller.exe install usbmmidd.inf usbmmidd
    :end
    echo [+] Virtual Display drivers installed
    goto repeat
)
if 2== %userc% (
    deviceinstaller64 stop usbmmidd
    deviceinstaller64 remove usbmmid
    echo [+] Virtual Display drivers removed
    goto repeat
)
if 3== %userc% (
    deviceinstaller64 enableidd 1
    echo [+] Virtual Display created
    goto repeat
)
if 4== %userc% (
    deviceinstaller64 enableidd 0
    echo [+] Virtual Display removed
    goto repeat
)
if 5== %userc% (
    goto exit
)
if 6== %userc% (
    echo [+] Read the opened Text file
    "idd_instructions.txt"
    goto repeat
)
:repeat
timeout /t 5
goto continue
endlocal
:exit
