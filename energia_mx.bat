@echo off
setlocal

:: Get current date in YYYYMMDD format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do if not defined DATE_STR set DATE_STR=%%I
set DATE_STR=%DATE_STR:~0,8%
if not "%~1"=="" set DATE_STR=%~1

:: Output filenames
set JSON_FILE=.\output\%DATE_STR%_response_raw.json
set CSV_FILE=.\output\%DATE_STR%_energia_mx_response.csv

:: Make POST request and save raw JSON
curl -s -X POST https://www.cenace.gob.mx/GraficaDemanda.aspx/obtieneValoresTotal ^
     -H "Content-Type: application/json; charset=UTF-8" ^
     -d "{\"gerencia\":\"9\"}" ^
     -o %JSON_FILE%

:: Use PowerShell to extract and parse the inner JSON string
powershell -NoProfile -Command ^
  "$outer = Get-Content '%JSON_FILE%' | ConvertFrom-Json; $inner = $outer.d | ConvertFrom-Json; $inner | Export-Csv -Path '%CSV_FILE%' -NoTypeInformation -Encoding UTF8"

echo CSV saved to %CSV_FILE%
endlocal
pause