


echo ------------------------------------------------

REM for /F %i in ( file.txt ) do echo %i
for /F "tokens=1,2,3" %%i in ( file.txt ) do echo %i %j %k %l

set �Q������������=20161212



REM SET /a COUNT=9
REM echo %SQL%

REM �Q�s�ǂݔ�΂��A�g�[�N���̐擪�R����擾
REM FOR /F "skip=2 tokens=1-3," %%a IN (AAA,BBB,CCC) DO (

REM �x�����ϐ���L��
 setlocal enabledelayedexpansion

FOR /F "skip=1 tokens=1-3," %%a IN ( file.txt ) DO (
  SET /a COUNT=!COUNT!+1
  echo !COUNT!

  REM   IF COUNT==2 SET �Q������������=%%c 
  IF COUNT==0 SET �Q������������=%%c 
  echo %COUNT%
  echo %�Q������������%
)
  SET /a COUNT=!COUNT!+1
  echo !COUNT!
echo 4

