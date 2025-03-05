@REM author:RainyCyan
@REM date:2025-03-05
@REM Description: This script is used to set the proxy for windows clash.


@echo off
:: open clash
set clash_path=D:/clash for windows/Clash for Windows.exe
start "" "%clash_path%"
timeout /t 5

@REM set the system proxy and allow lan

:: read next flag and do
set /p flag=Do you want to set the proxy for clash? (y/n)
if %flag%==y goto set_proxy
if %flag%==n goto pause

:set_proxy
@echo off
:: Set the proxy using netsh command
@REM netsh winhttp set proxy 127.0.0.1:7890
:: Start SSH tunnel
start "" ssh -NR 7890:localhost:7890 nbjl9030_ipv4
goto pause

:pause
pause