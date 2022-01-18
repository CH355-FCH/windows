@ECHO off

cls

echo Loading, sedang menyiapkan file program

@echo.

echo loading 0%
ping localhost -n 4 >nul
cls

echo loading 90%
ping localhost -n 2 >nul
cls

echo loading 100%
ping localhost -n 1 >nul

:start
color 0B
mode con:cols=110 lines=15
@cls
echo.
echo.
echo.
@echo	++	     000   000   00000	    000   000   000   000   000   000000000   00000000   000000
@echo	  ++	      000 000	 000 000    000   000   000   000   000   000	      000  000   0
@echo	   ++	        000	 000   000  000   000   000   000   000   000000000   000000     000000
@echo	  ++	      000 000	 000	000 000   000   000    000 000    000	      000  000        0
@echo	++   ______  000   000	 000	  00000   000000000      000      000000000   000   000  000000
@echo.
@echo					Made By Xnuvers007

@echo off

echo 1. Laporan Baterai / Battery Report
echo 2. Hapus File Tidak terpakai atau Cache (Aman) / Remove cache
echo 3. Jaringan wifi tidak ditemukan (Problem Wifi) / No Wifi Network Found
echo 4. Scan Harddisk
echo 5. System Info
echo 6. exit

set choice=
set /p choice="Masukan Pilihan : "

if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :bat
if '%choice%'=='2' goto :remo
if '%choice%'=='3' goto :netw
if '%choice%'=='4' goto :sc
if '%choice%'=='5' goto :sysinfo
if '%choice%'=='6' goto :exit
echo "%choice%" tidak valid, coba lagi

echo.
goto :start

:bat
powercfg /batteryreport /output "C:\battery.html"

:batul
echo 1. Firefox
echo 2. Edge
echo 3. Chrome

echo ingin membukanya dimana ?

set choice2=
set /p choice2="Masukan Piihan : "
if not '%choice2%'=='' set choice2=%choice2:~0,1%
if '%choice2%'=='1' goto :Firefox
if '%choice2%'=='2' goto :Edge
if '%choice2%'=='3' goto :Chrome
echo "%choice2%" tidak valid, coba lagi

echo.
goto :batul

:Firefox
start firefox file:\\\C:\battery.html

:Edge
start msedge file:\\\C:\battery.html

:Chrome
start chrome file:\\\C:\battery.html

:exit
pause
exit

:remo
echo sedang memeriksa file temporary
ping localhost -n 4 >nul
del /q/f/s %TEMP%\*

echo sedang memeriksa Recycle Bin
ping localhost -n 3 >nul

cd C:\
cd $Recycle.Bin
cleanmgr /sagerun:1

echo sedang memerika folder Prefetch / temporary 2
ping localhost -n 3 >nul

cd C:\Windows\Prefetch
del /Q /F /S C:\Windows\Prefetch\*
del C:\Windows\Prefetch\*

goto exit

:netw
netsh int ip reset resetlog.txt
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew

goto exit

:sc
echo Melakukan Scanning Harddisk
ping localhost -n 5 >nul

sfc /scannow

ping localhost -n 2 >nul

echo mencoba untuk memperbaiki dan menemukan Kesalahan pada Harddisk
ping localhost -n 5 >nul

CHKDSK c: /r /f

goto :exit

:sysinfo
systeminfo
goto exit