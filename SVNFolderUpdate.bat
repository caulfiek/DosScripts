@echo off & setlocal enableextensions
cls

rem ******************************************************
rem * Update directory structure for all SVN repos
rem *
rem * Kieran Caulfield, June 2012. Excelian Ltd.
rem *
rem ******************************************************

echo This will update all svn attached directories.
rem pause

Set drive=D:

%drive%
echo Drive is set to %drive%

Set SVN_User="kieran.caulfield@mycompany.com"

echo Updating SVN Directories...
rem *********************************

set myFolder=D:\MyScripts
set svn_URL="https://mycompany.jira.com/svn/MYPROJ/trunk/MyScripts"
Call :SVN_Folder


set myFolder=D:\MyScripts2
set svn_URL="https://mycompany.jira.com/svn/MYPROJ/trunk/MyScripts2"
Call :SVN_Folder

set myFolder=D:\CrystalReports
set svn_URL="https://mycompany.jira.com/svn/MYPROJ/trunk/CrystalReports"
Call :SVN_Folder

echo Please check results and press any key to end....
pause

GOTO End

rem *****************************
:SVN_Folder
rem *****************************

if exist "%myFolder%\.svn" (
  echo folder %myFolder%\.svn already exists - SVN UPDATE
	echo D:\TortoiseSVN\bin\svn update "%myFolder%"
	svn update "%myFolder%"
)

if not exist "%myFolder%\.svn" (
  	echo folder %myFolder%\.svn not found - SVN CHECKOUT %SVN_URL%
  	echo svn checkout %SVN_URL% "%myFolder%" --username %SVN_User%
	svn checkout %SVN_URL% "%myFolder%" --username %SVN_User%
)

GOTO :EOF
rem *******************************

:End
