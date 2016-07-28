@echo off
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d "0" /f 
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 
exit