@echo off
title WIN10 update assistant - Lovingly Made By [杨元] :-D
mode con cols=71 lines=14
color 5f

echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※
echo ※ ☆★ Windows 10 automatic update management tool ★☆
echo ※ 
echo ※ Please disable and exit all antivirus and security software
echo ※ Please right click and select "Run as administrator" this script!！
echo ※
echo ※ Author 〖Yang Yuan〗
echo ※ Help and feedback〖https://www.cnblogs.com/iyangyuan/p/10555073.html〗
echo ※
echo ※ Press any key to continue
echo ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
pause > nul

set wuaueng=C:\Windows\System32\wuaueng.dll

:menu
cls
echo.
echo.
echo --[1]--Disable Windows 10 system updates
echo --[2]--Restore Windows 10 system updates
echo --[3]--Exit program
echo.
echo.
echo.
echo --Note -- please do not delete this program after the task is successful, otherwise it cannot be restored！！！ x_x
echo.
echo.
echo.
choice /c 123 /n /m "Please select【1-3】："

echo %errorlevel%
if %errorlevel% == 1 goto disable
if %errorlevel% == 2 goto enable
if %errorlevel% == 3 goto end
else (goto menu)

:disable
takeown /f %wuaueng%
icacls %wuaueng% /grant "%USERDOMAIN%\%USERNAME%":(F)
copy %wuaueng% %~dp0duplicate
break>%wuaueng%

cls
echo.
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※
echo ※ Successfully blocked Windows 10 system updates! Mom no longer has to worry about the computer automatically restarting~
echo ※
echo ※〖Resolutely reminded〗【！Please do not delete this program, otherwise it will not be able to restore！】
echo ※
echo ※ Press any key to exit the program
echo ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo.
echo.
pause > nul
exit

:enable
if not exist %~dp0duplicate goto noduplicate
takeown /f %wuaueng%
icacls %wuaueng% /grant "%USERDOMAIN%\%USERNAME%":(F)
del /f /q %wuaueng%
copy %~dp0duplicate %wuaueng%

cls
echo.
echo.
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※
echo ※ Successfully restored Windows 10 system updates! Hurry up and upgrade your system~
echo ※
echo ※ Press any key to exit the program
echo ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo.
echo.
echo.
pause > nul
exit

:noduplicate
cls
echo.
echo.
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※ 
echo ※ ☆★ Warning ★☆
echo ※
echo ※ The program has detected that you have never blocked Windows 10 system updates, no need to restore!！
echo ※
echo ※ Press any key to exit the program
echo ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo.
echo.
pause > nul
exit

:end
exit


