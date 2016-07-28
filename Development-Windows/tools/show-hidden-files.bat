@echo off
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d "1" /f 
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 
exit