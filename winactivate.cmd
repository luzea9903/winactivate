@echo off
set "working_directory=%~dp0"
pushd "%working_directory%"

set "force_kms38=0"
set "headless=0"
set "skip_admin_check=0"

echo ================================================================
echo winactivate - Easy-to-use Windows HWID/KMS38 Activation Script.
echo https://github.com/luzeadev/winactivate
echo ================================================================
echo.
goto parse_arguments

:parse_arguments
if "%~1" neq "" (
    if "%~1" equ "/forcekms38" set "force_kms38=1"
    if "%~1" equ "/headless" set "headless=1"
    if "%~1" equ "/skipadmincheck" set "skip_admin_check=1"
    shift
    goto parse_arguments
)

goto main

:main
if "%skip_admin_check%" equ "0" (
    reg query "HKU\S-1-5-19" >nul 2>&1 || (
        echo This script requires Administrator privileges to run.
        echo Either run it from an administrator command prompt, or right-click the script and choose "Run as administrator".
        echo.
        goto exit
    )
)

for /f "tokens=6 delims=[]. " %%a in ('ver') do (
    if "%%a" lss "10240" (
        echo This script requires build 10240 or above to run.
        echo.
        goto exit
    )
)

echo Installing product key...
set "product_key=XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"
set "product_key_is_retail=0"
for /f "skip=2 tokens=3 delims=." %%a in ('reg query HKLM\SYSTEM\CurrentControlSet\Control\ProductOptions /v OSProductPfn') do (
    if "%%a" equ "4" (
        if "%force_kms38%" neq "0" (
            set "product_key=NPPR9-FWDCX-D2C8J-H872K-2YT43"
        ) else (
            set "product_key=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "7" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY"
            if "%%b" equ "17763" set "product_key=N69G4-B89J2-4G8F4-WWYCC-J464C"
            if "%%b" geq "20348" set "product_key=VDYBN-27WPP-V4HQT-9VMD4-VMK7H"
        )
    )
    if "%%a" equ "8" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=CB7KF-BWN84-R7R2Y-793K2-8XDDG"
            if "%%b" equ "17763" set "product_key=WMDGN-G9PQG-XVVXX-R3X43-63DFG"
            if "%%b" geq "20348" set "product_key=WX4NM-KYWYW-QJJR4-XV3QB-6VM33"
        )
    )
    if "%%a" equ "27" (
        if "%force_kms38%" neq "0" (
            set "product_key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
        ) else (
            set "product_key=3V6Q6-NQXCX-V8YXR-9QCYV-QPFCT"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "48" (
        if "%force_kms38%" neq "0" (
            set "product_key=W269N-WFGWX-YVC9B-4J6C9-T83GX"
        ) else (
            set "product_key=VK7JG-NPHTM-C97JM-9MPGT-3V66T"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "49" (
        if "%force_kms38%" neq "0" (
            set "product_key=MH37W-N47XK-V7XM9-C7227-GCQG9"
        ) else (
            set "product_key=2B87N-8KFHP-DKV6R-Y2C8J-PKCKT"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "50" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=JCKRF-N37P4-C2D82-9YXRT-4M63B"
            if "%%b" equ "17763" set "product_key=WVDHN-86M7X-466P6-VHXV7-YY726"
        )
    )
    if "%%a" equ "98" (
        if "%force_kms38%" neq "0" (
            set "product_key=3KHY7-WNT83-DGQKR-F7HPR-844BM"
        ) else (
            set "product_key=4CPRK-NM3K3-X6XXQ-RXX86-WXCHW"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "99" (
        if "%force_kms38%" neq "0" (
            set "product_key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
        ) else (
            set "product_key=N2434-X9D7W-8PF6X-8DV9T-8TYMD"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "100" (
        if "%force_kms38%" neq "0" (
            set "product_key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
        ) else (
            set "product_key=BT79Q-G7N6G-PGBYW-4YWX6-6F4BT"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "101" (
        if "%force_kms38%" neq "0" (
            set "product_key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
        ) else (
            set "product_key=YTMG3-N6DKC-DKB77-7M9GH-8HVX7"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "121" (
        if "%force_kms38%" neq "0" (
            set "product_key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
        ) else (
            set "product_key=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "122" (
        if "%force_kms38%" neq "0" (
            set "product_key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
        ) else (
            set "product_key=84NGF-MHBT6-FXBX8-QWJK7-DRR8H"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "125" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "19041" (
                set "product_key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D"
            ) else (
                if "%force_kms38%" neq "0" (
                    if "%%b" equ "10240" set "product_key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9"
                    if "%%b" equ "14393" set "product_key=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ"
                    if "%%b" equ "17763" set "product_key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D"
                ) else (
                    if "%%b" equ "10240" set "product_key=FWN7H-PF93Q-4GGP8-M8RF3-MDWWW"
                    if "%%b" equ "14393" set "product_key=NK96Y-D9CD8-W44CQ-R8YTK-DYJWX"
                    if "%%b" equ "17763" set "product_key=43TBQ-NH92J-XKTM7-KT3KK-P39PB"
                    set "product_key_is_retail=1"
                )
            )
        )
    )
    if "%%a" equ "126" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "19041" (
                set "product_key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H"
            ) else (
                if "%force_kms38%" neq "0" (
                    if "%%b" equ "10240" set "product_key=2F77B-TNFGY-69QQF-B8YKP-D69TJ"
                    if "%%b" equ "14393" set "product_key=QFFDN-GRT3P-VKWWX-X7T3R-8B639"
                    if "%%b" equ "17763" set "product_key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H"
                ) else (
                    if "%%b" equ "10240" set "product_key=8V8WN-3GXBH-2TCMG-XHRX3-9766K"
                    if "%%b" equ "14393" set "product_key=2DBW3-N2PJG-MVHW3-G7TDK-9HKR4"
                    if "%%b" equ "17763" set "product_key=M33WV-NHY3C-R7FPM-BQGPT-239PG"
                    set "product_key_is_retail=1"
                )
            )
        )
    )
    if "%%a" equ "145" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG"
            if "%%b" equ "17763" set "product_key=6NMRW-2C8FM-D24W7-TQWMY-CWH2D"
            if "%%b" geq "20348" set "product_key=QFND9-D3Y9C-J3KKY-6RPVP-2DPYV"
        )
    )
    if "%%a" equ "146" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=PTXN8-JFHJM-4WC78-MPCBR-9W4KR"
            if "%%b" equ "17763" set "product_key=N2KJX-J94YW-TQVFB-DG9YT-724CC"
            if "%%b" geq "20348" set "product_key=67KN8-4FYJW-2487Q-MQ2J7-4C4RG"
        )
    )
    if "%%a" equ "161" (
        if "%force_kms38%" neq "0" (
            set "product_key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"
        ) else (
            set "product_key=DXG7C-N36C4-C4HTG-X4T3X-2YV77"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "162" (
        if "%force_kms38%" neq "0" (
            set "product_key=9FNHH-K3HBT-3W4TD-6383H-6XYWF"
        ) else (
            set "product_key=WYPNQ-8C467-V2W6J-TX4WX-WT2RQ"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "164" (
        if "%force_kms38%" neq "0" (
            set "product_key=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y"
        ) else (
            set "product_key=8PTT6-RNW4C-6V7J2-C2D3X-MHBPB"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "165" (
        if "%force_kms38%" neq "0" (
            set "product_key=YVWGF-BXNMC-HTQYQ-CPQ99-66QFC"
        ) else (
            set "product_key=GJTYN-HDMQY-FRR76-HVGC7-QPF8P"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "168" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=VP34G-4NPPG-79JTQ-864T4-R3MQX"
            if "%%b" equ "17763" set "product_key=FDNH6-VW9RW-BXPJ7-4XTYG-239TB"
            if "%%b" geq "20348" set "product_key=6N379-GGTMK-23C6M-XVVTC-CKFRQ"
        )
    )
    if "%%a" equ "171" (
        set "product_key=YYVX9-NTFWV-6MDM3-9PT4T-4M68B"
    )
    if "%%a" equ "172" (
        set "product_key=44RPN-FTY23-9VTTB-MP9BX-T84FV"
    )
    if "%%a" equ "175" (
        if "%force_kms38%" neq "0" (
            set "product_key=7NBT4-WGBQX-MP4H7-QXFF8-YP3KX"
        ) else (
            set "product_key=NJCF7-PW8QT-3324D-688JX-2YV66"
            set "product_key_is_retail=1"
        )
    )
    if "%%a" equ "188" (
        set "product_key=XQQYW-NFFMW-XJPBH-K8732-CKFFD"
        set "product_key_is_retail=1"
    )
    if "%%a" equ "191" (
        set "product_key=QPM6N-7J2WJ-P88HH-P3YRH-YY74H"
        set "product_key_is_retail=1"
    )
    if "%%a" equ "203" (
        set "product_key=KY7PN-VR6RX-83W6Y-6DDYQ-T6R4W"
        set "product_key_is_retail=1"
    )
)


if "%product_key%" equ "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX" (
    echo This edition or version of Windows is not supported by this script.
    echo.
    goto exit
)

cscript /nologo "%systemdrive%\Windows\System32\slmgr.vbs" /ipk "%product_key%"

if "%errorlevel%" neq "0" (
    echo An error occurred while installing the product key.
    echo.
    goto exit
)

if exist "%working_directory%GenuineTicket.xml" del /f "%working_directory%GenuineTicket.xml"

if not exist "%working_directory%gatherosstate.exe" (
    echo This script requires gatherosstate.exe to be in the same directory as this script.
    echo Please re-download the script from https://github.com/luzeadev/winactivate/releases.
    echo.
    goto exit
)

if not exist "%working_directory%slc.dll" (
    echo This script requires slc.dll to be in the same directory as this script.
    echo Please re-download the script from https://github.com/luzeadev/winactivate/releases.
    echo.
    goto exit
)

echo Patching gatherosstate.exe...
rundll32 "%working_directory%slc.dll",PatchGatherosstate

if not exist "%working_directory%gatherosstatemodified.exe" (
    echo An error occurred while patching gatherosstate.exe.
    echo.
    goto exit
)

echo Generating GenuineTicket.xml...
"%working_directory%gatherosstatemodified.exe"

if not exist "%working_directory%GenuineTicket.xml" (
    echo GenuineTicket.xml generation failed. Please check your internet connection and try again.
    echo.
    goto exit
)

echo Applying GenuineTicket.xml...
copy /y /b "%working_directory%GenuineTicket.xml" "%systemdrive%\ProgramData\Microsoft\Windows\ClipSVC\GenuineTicket"
"%systemdrive%\Windows\System32\ClipUp.exe" -o -v
echo.

if "%errorlevel%" neq "0" (
    echo ClipUp.exe failed to apply GenuineTicket.xml. Please check your internet connection and try again.
    echo.
    goto exit
)

if "%product_key_is_retail%" neq "0" (
    echo Activating Windows...
    cscript /nologo "%systemdrive%\Windows\System32\slmgr.vbs" /ato
)

for /f %%a in ('powershell -NoProfile -Command "(Get-CimInstance -Query 'SELECT LicenseStatus FROM SoftwareLicensingProduct WHERE ApplicationId=''55c92734-d682-4d71-983e-d6ec3f16059f'' AND LicenseStatus <> 0').LicenseStatus"') do (
    if "%%a" neq "1" (
        echo Activation failed. Please check your internet connection and try again.
        echo.
        goto exit
    )
)

echo Activation complete.
echo.
goto exit

:exit
popd
if "%headless%" neq "0" (
    pause
)
goto :eof
