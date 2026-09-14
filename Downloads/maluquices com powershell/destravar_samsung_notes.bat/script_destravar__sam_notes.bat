net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando permissao
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
 
setlocal
set "REGPATH=HKLM\HARDWARE\DESCRIPTION\System\BIOS"
set "BACKUPFILE=%~dp0backup_bios_original.reg"
 
reg export "%REGPATH%" "%BACKUPFILE%" /y >nul 2>&1
 
reg add "%REGPATH%" /v SystemProductName  /t REG_SZ /d "NP950QDB-KA1US" /f
reg add "%REGPATH%" /v SystemManufacturer /t REG_SZ /d "Samsung" /f
 
echo.
echo Concluido. Reinicie o Samsung Notes para aplicar.
pause
 