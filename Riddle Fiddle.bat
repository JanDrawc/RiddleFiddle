@echo off

set lives= 3
set att= 0
set att1= 0
set att2= 0
set att3= 0
set att4= 0
set att5= 0
set lq= 1
set score= 0

set "q1n="
set "q2n="
set "q3n="
set "q4n="
set "q5n="

set "qq=3"
set "ql1="
set "ql2="
set "ql3="
set "qa="

goto splash


:splash

color 70
echo.
echo.
echo.
echo.
echo.
echo.
type title.txt
echo.
echo.
echo.
echo.
echo.
@timeout /t 5 /nobreak>nul
goto start


:win
cls
color A1
echo.
type titlesuc.txt
type divider.txt
set /a att1=%att1%+1
set /a att2=%att2%+1
set /a att3=%att3%+1
set /a att4=%att4%+1
set /a att5=%att5%+1
set /a att=%att1%+%att2%+%att3%+%att4%+%att5%
set /a score=%lives%-%att%+5+4
if %att% equ 5 (set a/ score=%score% + 1)
echo.
echo.
echo.
echo			Good job %name%, you nerd. You pass.
echo.
echo.
type divider.txt
echo.
echo.
echo		Attempts:	Lives remaining: %lives%	
echo.
echo		Q1: %att1%	
echo		Q2: %att2%	
echo		Q3: %att3%				Final Score:%score% /12
echo		Q4: %att4%	
echo		Q5: %att5%
echo	     Total: %att%
(echo 				%name% :  %score%)>>scores.txt	
echo.
echo.
type divider.txt
echo.
echo.
echo					Previous Scores:
echo.
type scores.txt
echo.
echo.
type divider.txt
echo.
echo.
pause
exit


:lost
cls
color C0
echo.
type titlelos.txt
type divider.txt
(echo   %name% failed on question %lq%)>>scores.txt
echo.
echo.
echo.
echo			That's it. Lost all your lives. Great job loser
echo.
echo.
echo.
type divider.txt
echo.
echo.
echo		Attempts:	Lives remaining: %lives%	
echo.
echo		Q1: %att1%	
echo		Q2: %att2%	
echo		Q3: %att3%				Final Score:%score% /12
echo		Q4: %att4%	
echo		Q5: %att5%
echo.
echo.
type divider.txt
echo.
echo.
echo					Previous Scores:
echo.
type scores.txt
echo.
echo.
type divider.txt
echo.
echo.
pause
exit

:succ
cls
color A1
echo.
type title.txt
type divider.txt
echo.
echo.
echo.
echo		question:%lq%       Lives: %lives%      Attempt: %disatt%       Name: %name%
echo.
type divider.txt
echo.
echo.
echo			Right answer!
echo.
echo.
if %lq% equ 1 (set /a att=%att1%)
if %lq% equ 2 (set /a att=%att2%)
if %lq% equ 3 (set /a att=%att3%)
if %lq% equ 4 (set /a att=%att4%)
if %lq% equ 5 (set /a att=%att5%)
if %att% equ 0 (set /a lives=%lives% + 1&echo 		First Try! You gain a life!)
set /a att=0
set /a lq=%lq%+1
echo.
echo.
echo.
type divider.txt
echo.
echo.
echo.
pause
if %lq% equ 1 (goto pickq)
if %lq% equ 2 (goto pickq)
if %lq% equ 3 (goto pickq)
if %lq% equ 4 (goto pickq)
if %lq% equ 5 (goto pickq)
if %lq% equ 6 (goto win)

:fail
cls
color C0
echo.
type title.txt
type divider.txt
echo.
echo.
echo.
echo		question:%lq%       Lives: %lives%      Attempt: %disatt%       Name: %name%
echo.
type divider.txt
echo.
set /a lives=%lives% - 1
if %lq% equ 1 (set /a att1=%att1% +1)
if %lq% equ 2 (set /a att2=%att2% +1)
if %lq% equ 3 (set /a att3=%att3% +1)
if %lq% equ 4 (set /a att4=%att4% +1)
if %lq% equ 5 (set /a att5=%att5% +1)
echo.
echo.
echo.
echo			Wrong loser. Try again.
echo.
echo.
echo.
type divider.txt
pause
if %lives% gtr 0 (goto printq) else (goto lost)

:start
cls
for /f "delims=" %%A in ( ' dir /b /a-d /s "q/" ^| find /c /v "" ' ) do set qcount=%%A
color 70
echo.
type title.txt
type divider.txt
echo.
echo.
echo.
echo			Answer the riddles correctly or you lose
type divider.txt
echo.
echo.
echo			There is a total of %qcount% questions.
echo			You will be asked 5 random ones.
echo			Type Your answer and press enter.
echo			Only type in lower case and no spaces, "a", "an" or "the".
echo.
echo			Wrong answer will cost you a life. You start with %lives%.
echo			If you answer correctly on the first attempt you will gain a life
echo			If you lives reach 0, game over.
echo.
echo.
type divider.txt
echo.			
set /p web=   		Enter Your name to save your score: 
set name=%web%
goto pickq


:pickq
set /a qq=%random% %%%qcount% +1

if %qq% equ %q1n%  (goto pickq)
if %qq% equ %q2n%  (goto pickq)
if %qq% equ %q3n%  (goto pickq)
if %qq% equ %q4n%  (goto pickq)
if %qq% equ %q5n%  (goto pickq)

if %lq% equ 1 (set /a q1n=%qq%)
if %lq% equ 2 (set /a q2n=%qq%)
if %lq% equ 3 (set /a q3n=%qq%)
if %lq% equ 4 (set /a q4n=%qq%)
if %lq% equ 5 (set /a q5n=%qq%)

set /p qa=< q/%qq%.txt  

for /F "skip=1 delims=" %%i in (q/%qq%.txt) do set "ql1=%%i"&goto l2l
:l2l
for /F "skip=2 delims=" %%i in (q/%qq%.txt) do set "ql2=%%i"&goto l3l
:l3l
for /F "skip=3 delims=" %%i in (q/%qq%.txt) do set "ql3=%%i"&goto printq


:printq
cls
if %lq% equ 1 (set /a disatt=%att1%)
if %lq% equ 2 (set /a disatt=%att2%)
if %lq% equ 3 (set /a disatt=%att3%)
if %lq% equ 4 (set /a disatt=%att4%)
if %lq% equ 5 (set /a disatt=%att5%)
color 90
echo.
type title.txt
type divider.txt
echo.
echo.
echo.
echo		question:%lq%       Lives: %lives%      Attempt: %disatt%       Name: %name%
echo.
type divider.txt
echo.
echo %ql1%
echo %ql2%
echo %ql3%
echo.
type divider.txt				
echo.
set /p web=       		Answer: 
if "%web%"=="%qa%" (goto succ) else (goto fail)