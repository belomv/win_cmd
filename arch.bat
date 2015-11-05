rem ************************************************ 
rem		File:    arch.bat
rem		Author:  beloborodov.mv   
rem		Last time updated: 05/11/2015	
rem		backups logs 
rem ************************************************ 

@echo off
chcp 866
setlocal enabledelayedexpansion

rem Declare variables.
rem Convert date format.
set d=%date:~6,4%-%date:~3,2%-%date:~0,2%
set in="%PROGRAMFILES(x86)%\Apache Software Foundation\Tomcat 7.0\logs"
set out=C:\Logs

rem Find files older than 30 days. Archive and delete them.
rem Result in log file.
forfiles /P !in! /S /D -30 /C "cmd /c C:\Distr\7zip\7za a -tzip !out!\cre_!d!.zip @file && del @file" | findstr /P /I /V "compressing 7-zip" >> !out!\log_7zip.log

exit /b
