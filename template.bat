@echo off
set source=C:\Users\fmole\Documents\repos\templates
set dest=C:\Users\fmole\Documents\repos


if [%1] == [] (
echo #######################TEMPLATE##############################
echo # desc: Copies a template code structure		    #
echo #	     from a list of templates			    #
echo #	     to any destination			            #
echo # commands: 				                    #
echo #  ^>template list		: Lists all templates 	    # 
echo #  ^>template ^<template^> ^<name^> 	: Copies template folder    #
echo #############################################################
echo source folder: 		%source%
echo destination folder:	%dest%                    
goto done
)
 
if %1 == list (
dir /ad /D %source%
goto done
)
xcopy /I /E %source%\%1 %dest%\%2

echo %dest%\%2

:done