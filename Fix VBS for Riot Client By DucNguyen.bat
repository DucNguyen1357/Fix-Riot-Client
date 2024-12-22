@echo off
title Fix VBS for Riot Client By DucNguyen

::Chỉnh Cửa Sổ và màu
mode 85, 20
cls

::Hiển thị Tiếng Việt
chcp 65001
cls

:: Chạy quyền Administrator
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
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
title Fix VBS for Valorant By DucNguyen - Options
echo.
echo:[92m               Fix VBS for Riot Client By DucNguyen [1m [0m
echo:[92m               Phiên bản : 0.1 Beta [1m [0m  
echo:[92m               Công cụ tắt / bật Hyper-V để chạy Vanguard (Fix 9005) [1m [0m      
echo:         ____________________________________________________________________
echo:                   
echo:[93m               Chọn 1 trong các tuỳ chọn dưới đây  [1m [0m 
echo:[93m               Choose one of the options below  [1m [0m  
echo.                                   
echo:             [1] Tắt Hyper-V / Turn Off Hyper-V 
echo:             [2] Bật Hyper-V / Turn On Hyper-V
echo:         ____________________________________________________________________
choice /C:12 /N
set _erl=%errorlevel%
if %_erl%==2 goto Enable
if %_erl%==1 goto Disable


::Tắt Bật Hyper-V
:Disable
cls
title Fix VBS for Valorant By DucNguyen - Disable Hyper-V
bcdedit /set hypervisorlaunchtype off
echo:Done!
goto Finish1

:Enable
cls
title Fix VBS for Valorant By DucNguyen - Enable Hyper-V
bcdedit /set hypervisorlaunchtype on
echo:Done!
goto Finish2


::Hoàn thành
:Finish1
title Fix VBS for Valorant By DucNguyen - Done Disable
cls
echo:Done!
set msgTitle="Fix VBS for Valorant By DucNguyen"
echo Wsh.Echo MsgBox("Successfully Disable Hyper-V!" + vbCrLf + "Restart to have a effect.",vbOKOnly,%msgTitle%) >tmp.vbs
for /f %%i in ('cscript tmp.vbs //nologo //e:vbscript') do (set "ret=%%i")
del /q tmp.vbs
goto End

:Finish2
title Fix VBS for Valorant By DucNguyen - Done Enable
cls
echo:Done!
set msgTitle="Fix VBS for Valorant By DucNguyen"
echo Wsh.Echo MsgBox("Successfully Enable Hyper-V!" + vbCrLf + "Restart to have a effect.",vbOKOnly,%msgTitle%) >tmp.vbs
for /f %%i in ('cscript tmp.vbs //nologo //e:vbscript') do (set "ret=%%i")
del /q tmp.vbs
goto End


::Kết thúc
:End
title Fix VBS for Valorant By DucNguyen - Finish
cls
echo:[92m               Fix VBS for Valorant By DucNguyen [1m [0m
echo:[92m               Phiên bản : 0.1 Beta [1m [0m  
echo:[92m               Công cụ tắt / bật Hyper-V để chạy Vanguard (Fix 9005) [1m [0m      
echo:         ____________________________________________________________________
echo:                   
echo:[93m              Áp dụng tuỳ chọn thành công!  [1m [0m 
echo:[93m              Sau khi thay đổi sẽ tự động khởi động lại máy  [1m [0m  
echo:[93m              Trước khi khởi động lại máy bạn phải thoát tất cả ứng dụng.  [1m [0m  
echo:[93m              Bạn có muốn khởi động lại máy chứ ?  [1m [0m  
echo.                                 
echo:             [1] Có, khởi động lại máy.
echo:             [2] Không, tôi sẽ khởi động lại máy sau.
echo:         ____________________________________________________________________
choice /C:12 /N
set _erl=%errorlevel%
if %_erl%==2 goto UnReset
if %_erl%==1 goto Reset


::Tuỳ chọn khởi động lại máy tính
:Reset
cls
shutdown /r /t 10
echo:[92m            Fix VBS for Valorant By DucNguyen [1m [0m
echo:[92m            Phiên bản : 0.1 Beta [1m [0m  
echo:[92m            Công cụ tắt / bật Hyper-V để chạy Vanguard (Fix 9005) [1m [0m      
echo:      ____________________________________________________________________
echo:                   
echo:[93m        Máy tính của bạn sẽ tắt sau 10 giây nữa!  [1m [0m 
echo:[93m        Cảm ơn bạn đã sử dụng chương trình. [1m [0m  
echo:[93m        Bấm Enter để thoát.  [1m [0m  
echo:[93m        Nếu thấy công cụ này hay hãy Donate cho mình tại đây :  [1m [0m  
echo:[93m        https://ducnguyen.x10.bz/ducnguyensoftware/donate  [1m [0m  
echo:      ____________________________________________________________________
timeout /t 10
exit

:UnReset
cls
echo:[92m               Fix VBS for Valorant By DucNguyen [1m [0m
echo:[92m               Phiên bản : 0.1 Beta [1m [0m  
echo:[92m               Công cụ tắt / bật Hyper-V để chạy Vanguard (Fix 9005) [1m [0m      
echo:         ____________________________________________________________________
echo:                  
echo:[93m           Bạn đã huỷ tự động tắt máy tính!  [1m [0m 
echo:[93m           Cảm ơn bạn đã sử dụng chương trình.  [1m [0m  
echo:[93m           Hãy khởi động lại máy để có hiệu lực.  [1m [0m  
echo:[93m           Nếu thấy công cụ này hay hãy Donate cho mình tại đây :  [1m [0m  
echo:[93m           https://ducnguyen.x10.bz/ducnguyensoftware/donate  [1m [0m  
echo:         ____________________________________________________________________
timeout /t 10
exit



