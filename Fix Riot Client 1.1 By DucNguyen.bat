@echo off
@set version=1.1
title Fix Riot Client %version% By DucNguyen

::Chỉnh Cửa Sổ và màu
mode 85, 20
cls

::Hiển thị Tiếng Việt
chcp 65001
cls

:: Chạy quyền Administrator
::-------------------------------------
REM  --> Kiểm tra quyền
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> Nếu có lỗi ở đây là chúng ta éo có quyền Admin, quay xe.
if '%errorlevel%' NEQ '0' (
    echo Bạn phải chạy phần mềm này với Administrator - Phần mềm sẽ tự động thoát...
    timeout /t 10
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::Menu
:Start
cls
title Fix Riot Client %version% By DucNguyen - Options
echo.
echo:[91m       Fix Riot Client By DucNguyen [1m [0m
echo:[92m       Phiên bản : %version% Release [1m [0m  
echo:[92m       Website : ducnguyen.top/ducnguyentech [1m [0m  
echo:[96m       NEW UPDATE %version% : Thêm lựa chọn sửa lỗi không chạy được Game LOL[1m [0m      
echo:      ________________________________________________________________________
echo:                  
echo:[93m            Chọn 1 trong các tuỳ chọn dưới đây  [1m [0m 
echo:[93m            Choose one of the options below  [1m [0m  
echo.                                   
echo:        [1] [91mTắt[0m hoặc [92mBật[0m Hyper-V / Turn [91mOff[0m or [92mON[0m Hyper-V
echo:        [2] Sửa lỗi [91mVAN-128[0m / Fix Error [91mVAN-128[0m
echo:        [3] Sửa lỗi [91mKhông chạy được Game LOL[0m / Fix Error [91mCan't Run LOL Game[0m
echo:        [4] [91mThoát[0m / [91mExit[0m
echo:      ________________________________________________________________________
choice /C:1234 /N
set _erl=%errorlevel%
if %_erl%==4 exit
if %_erl%==3 goto ERLOLCR
if %_erl%==2 goto VAN128
if %_erl%==1 goto VAN9005


::Fix VAN-9005
:VAN9005
cls
title Fix Riot Client %version% By DucNguyen - Fix VAN9005
echo.
echo: [92mBạn chọn :[0m [96mFix VAN 9005[0m / [92mYou Select :[0m [96mFix VAN 9005[0m
echo.
echo:[91m       Fix Riot Client By DucNguyen [1m [0m
echo:[92m       Phiên bản : %version% Release [1m [0m  
echo:[92m       Website : ducnguyen.top/ducnguyentech [1m [0m  
echo:[96m       NEW UPDATE %version% : Thêm lựa chọn sửa lỗi không chạy được Game LOL[1m [0m      
echo:      ________________________________________________________________________
echo:                   
echo:[93m            Chọn 1 trong các tuỳ chọn dưới đây  [1m [0m 
echo:[93m            Choose one of the options below  [1m [0m   
echo.                                   
echo:        [1] [91mTắt[0m Hyper-V / Turn [91mOff[0m Hyper-V
echo:        [2] [92mBật[0m Hyper-V / Turn [92mON[0m Hyper-V
echo:        [3] [91mQuay lại trang đầu[0m / [91mReturn to the first page[0m
echo:      ________________________________________________________________________
choice /C:123 /N
set _erl=%errorlevel%
if %_erl%==3 goto Start
if %_erl%==2 goto VAN9005DISA
if %_erl%==1 goto VAN9005ENA

::Lệnh xử lý VAN9005
:DAN9005DISA
cls
title Fix Riot Client %version% By DucNguyen - Disable Hyper-V
echo:[91mDisable Test Signed Drivers[0m
bcdedit /set hypervisorlaunchtype off
echo:[92mDisabled Test Signed Drivers - DONE![0m
timeout /t 5
goto Finish90051

:VAN9005ENA
cls
title Fix Riot Client %version% By DucNguyen - Enable Hyper-V
echo:[91mEnable Enable Hyper-V[0m
bcdedit /set hypervisorlaunchtype on
echo:[92mEnabled Enable Hyper-V - DONE![0m
timeout /t 5
goto Finish90052

::Hoàn thành VAN 9005
:Finish90051
title Fix Riot Client %version% By DucNguyen - Done Disable
cls
echo:Done!
set msgTitle="Fix Riot Client By DucNguyen"
echo Wsh.Echo MsgBox("Successfully Disable Hyper-V!" + vbCrLf + "Restart to have a effect.",vbOKOnly,%msgTitle%) >tmp.vbs
for /f %%i in ('cscript tmp.vbs //nologo //e:vbscript') do (set "ret=%%i")
del /q tmp.vbs
echo.
echo:[92m Đã tắt Hyper-V thành công![0m
echo:[92m Tự động chuyển sang Menu kết thúc trong 10 giây.[0m
timeout /t 10
goto End

:Finish90052
title Fix Riot Client %version% By DucNguyen - Done Enable
cls
echo:Done!
set msgTitle="Fix VBS for Valorant By DucNguyen"
echo Wsh.Echo MsgBox("Successfully Enable Hyper-V!" + vbCrLf + "Restart to have a effect.",vbOKOnly,%msgTitle%) >tmp.vbs
for /f %%i in ('cscript tmp.vbs //nologo //e:vbscript') do (set "ret=%%i")
del /q tmp.vbs
echo.
echo:[92m Đã bật Hyper-V thành công![0m
echo:[92m Tự động chuyển sang Menu kết thúc trong 10 giây.[0m
timeout /t 10
goto End

::Fix VAN-128
:VAN128
cls
title Fix Riot Client %version% By DucNguyen - Fix VAN128
echo.
echo: [92mBạn chọn :[0m [96mFix VAN 128[0m / [92mYou Select :[0m [96mFix VAN 128[0m
echo.
echo:[91m       Fix Riot Client By DucNguyen [1m [0m
echo:[92m       Phiên bản : %version% Release [1m [0m  
echo:[92m       Website : ducnguyen.top/ducnguyentech [1m [0m  
echo:[96m       NEW UPDATE %version% : Thêm lựa chọn sửa lỗi không chạy được Game LOL[1m [0m      
echo:      ________________________________________________________________________
echo:                   
echo:[93m            Chọn 1 trong các tuỳ chọn dưới đây  [1m [0m 
echo:[93m            Choose one of the options below  [1m [0m  
echo.                                   
echo:        [1] [92mBắt đầu sửa lỗi[0m / [92mStart debugging[0m
echo:        [2] [91mQuay lại trang đầu[0m / [91mReturn to the first page[0m
echo:      ________________________________________________________________________
choice /C:12 /N
set _erl=%errorlevel%
if %_erl%==2 goto Start
if %_erl%==1 goto FIXVAN128

::Lệnh xử lý VAN128
:FIXVAN128
cls
title Fix Riot Client %version% By DucNguyen - Disable Test Signed Drivers
echo:[91mDisable Test Signed Drivers[0m
bcdedit /set TESTSIGNING off
echo:[92mDisabled Test Signed Drivers - DONE![0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Disable Driver Signature Enforcement
echo:[91mDisable Test Signed Drivers[0m
bcdedit /set nointegritychecks OFF
echo:[92mDisabled Test Signed Drivers - DONE![0m
echo.
title Fix Riot Client %version% By DucNguyen - Enable Virtualization Based Security
echo:[91mEnable Virtualization Based Security[0m
Set "Test1=HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard"
reg.exe add "%Test1%" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f
echo:[92mEnabled Virtualization Based Security - DONE![0m
echo.
title Fix Riot Client %version% By DucNguyen - Enable Virtualization Based Security LOCKED UEFI-LEGACY
echo:[91mEnable Virtualization Based Security LOCKED UEFI-LEGACY[0m
Set "Test2=HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard"
reg.exe add "%Test2%" /v "Locked" /t REG_DWORD /d 0 /f
echo:[92mEnabled Virtualization Based Security LOCKED UEFI-LEGACY - DONE![0m
echo.
echo:[92m Đã sửa lỗi VAN-128 thành công![0m
echo:[92m Tự động chuyển sang Menu kết thúc trong 10 giây.[0m
timeout /t 10
goto End

::Fix Lỗi Không Vào Được LOL
:ERLOLCR
cls
title Fix Riot Client %version% By DucNguyen - Kill Riot Client UX
echo:[91mKilling Apps...[0m
taskkill /F /IM RiotClientUx.exe
echo:[92mKill Done.[0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Kill Riot Client Services 
echo:[91mKilling Apps...[0m
taskkill /F /IM RiotClientServices.exe
echo:[92mKill Done.[0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Kill League Client 
echo:[91mKilling Apps...[0m
taskkill /F /IM LeagueClient.exe
echo:[92mKill Done.[0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Kill Valorant 
echo:[91mKilling Apps...[0m
taskkill /F /IM Valorant.exe
echo:[92mKill Done.[0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Kill Vanguard Tray
echo:[91mKilling Apps...[0m
taskkill /F /IM VanguardTray.exe
echo:[92mKill Done.[0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Kill Vanguard Auth Services 
echo:[91mKilling Apps...[0m
taskkill /F /IM VGAuthService.exe 
echo:[92mKill Done.[0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Kill Vanguard Tray Notification
echo:[91mKilling Apps...[0m
taskkill /F /IM vgtray.exe
echo:[92mKill Done.[0m
echo:Done!
echo.
title Fix Riot Client %version% By DucNguyen - Disable Devices Override
echo:[91mDisable Devices Override[0m
Set "Test3=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options"
reg.exe add "%Test3%" /v "DevOverrideEnable" /t REG_DWORD /d 0 /f
echo:[92mDisable Devices Override - DONE![0m
echo.
echo:[92m Đã sửa lỗi Không vào được LOL thành công![0m
echo:[92m Tự động chuyển sang Menu kết thúc trong 10 giây.[0m
timeout /t 10
goto End

::Kết thúc
:End
title Fix Riot Client %version% By DucNguyen - Finish
cls
echo:[91m       Fix Riot Client By DucNguyen [1m [0m
echo:[92m       Phiên bản : %version% Release [1m [0m  
echo:[92m       Website : ducnguyen.top/ducnguyentech [1m [0m  
echo:[96m       NEW UPDATE %version% : Thêm lựa chọn sửa lỗi không chạy được Game LOL[1m [0m      
echo:      ________________________________________________________________________
echo:                   
echo:[93m            Áp dụng tuỳ chọn thành công!  [1m [0m 
echo:[93m            Sau khi thay đổi sẽ tự động khởi động lại máy  [1m [0m  
echo:[93m            Trước khi khởi động lại máy bạn phải thoát tất cả ứng dụng.  [1m [0m  
echo:[93m            Bạn có muốn khởi động lại máy chứ ?  [1m [0m  
echo.                                 
echo:        [1] Có, khởi động lại máy.
echo:        [2] Không, tôi sẽ khởi động lại máy sau.
echo:      ________________________________________________________________________
choice /C:12 /N
set _erl=%errorlevel%
if %_erl%==2 goto UnReset
if %_erl%==1 goto Reset


::Tuỳ chọn khởi động lại máy tính
:Reset
title Fix Riot Client %version% By DucNguyen - Set Reset Done!
cls
shutdown /r /t 10
echo:[91m       Fix Riot Client By DucNguyen [1m [0m
echo:[92m       Phiên bản : %version% Release [1m [0m  
echo:[92m       Website : ducnguyen.top/ducnguyentech [1m [0m  
echo:[96m       NEW UPDATE %version% : Thêm lựa chọn sửa lỗi không chạy được Game LOL[1m [0m      
echo:      ________________________________________________________________________
echo:                   
echo:[93m        Máy tính của bạn sẽ tắt sau 10 giây nữa!  [1m [0m 
echo:[93m        Cảm ơn bạn đã sử dụng chương trình. [1m [0m  
echo:[93m        Bấm Enter để thoát.  [1m [0m  
echo:[93m        Nếu thấy công cụ này hay hãy Donate cho mình tại đây :  [1m [0m  
echo:[93m        https://ducnguyen.top/ducnguyentech/donate  [1m [0m  
echo:      ________________________________________________________________________
timeout /t 10
exit

:UnReset
title Fix Riot Client %version% By DucNguyen - Reset After
cls
echo:[91m       Fix Riot Client By DucNguyen [1m [0m
echo:[92m       Phiên bản : %version% Release [1m [0m  
echo:[92m       Website : ducnguyen.top/ducnguyentech [1m [0m  
echo:[96m       NEW UPDATE %version% : Thêm lựa chọn sửa lỗi không chạy được Game LOL[1m [0m      
echo:      ________________________________________________________________________
echo:                  
echo:[93m           Bạn đã huỷ tự động tắt máy tính!  [1m [0m 
echo:[93m           Cảm ơn bạn đã sử dụng chương trình.  [1m [0m  
echo:[93m           Hãy khởi động lại máy để có hiệu lực.  [1m [0m  
echo:[93m           Nếu thấy công cụ này hay hãy Donate cho mình tại đây :  [1m [0m  
echo:[93m           https://ducnguyen.top/ducnguyentech/donate  [1m [0m  
echo:      ________________________________________________________________________
timeout /t 10
exit



