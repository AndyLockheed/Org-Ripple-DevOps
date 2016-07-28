@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
call %systemdrive%\ProgramData\chocolatey\bin\RefreshEnv
SET PATH=C:\Program Files\Git\bin;C:\tools\mysql\current\bin;%PATH%
puppet apply --modulepath %SystemDrive%\vagrant\modules %SystemDrive%\vagrant\manifests\default.pp