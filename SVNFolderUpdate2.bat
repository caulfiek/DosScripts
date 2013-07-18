@echo off & setlocal enableextensions
cls

rem ******************************************************
rem * Create folders if they don't already exist
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
Call :Create_Folder
Call :SVN_Folder


set myFolder=D:\MyScripts2
set svn_URL="https://mycompany.jira.com/svn/MYPROJ/trunk/MyScripts2"
Call :Create_Folder
Call :SVN_Folder

set myFolder=D:\CrystalReports
set svn_URL="https://mycompany.jira.com/svn/MYPROJ/trunk/CrystalReports"
Call :Create_Folder
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

rem *****************************
:Create_Folder
rem *****************************

if exist "%drive%\%myFolder%\" (
	echo folder %drive%\%myFolder% already exists
)

if not exist "%drive%\%myFolder%\" (
  	echo folder %drive%\%myFolder% not found
  	echo creating folder %drive%\%myFolder%
	md %drive%\%myFolder%	
)

GOTO :EOF
rem *******************************

:End
