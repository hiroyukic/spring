


echo ------------------------------------------------

REM for /F %i in ( file.txt ) do echo %i
for /F "tokens=1,2,3" %%i in ( file.txt ) do echo %i %j %k %l

set ２月利息元加日=20161212



REM SET /a COUNT=9
REM echo %SQL%

REM ２行読み飛ばし、トークンの先頭３列を取得
REM FOR /F "skip=2 tokens=1-3," %%a IN (AAA,BBB,CCC) DO (

REM 遅延環境変数を有効
 setlocal enabledelayedexpansion

FOR /F "skip=1 tokens=1-3," %%a IN ( file.txt ) DO (
  SET /a COUNT=!COUNT!+1
  echo !COUNT!

  REM   IF COUNT==2 SET ２月利息元加日=%%c 
  IF COUNT==0 SET ２月利息元加日=%%c 
  echo %COUNT%
  echo %２月利息元加日%
)
  SET /a COUNT=!COUNT!+1
  echo !COUNT!
echo 4

