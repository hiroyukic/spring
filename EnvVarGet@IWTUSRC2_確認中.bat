@rem -------------------------------------------------------------------------------------------------------------------
@rem   MODULE        EnvVarGet@IWTUSRC2
@rem   FILE          EnvVarGet@IWTUSRC2.bat
@rem   NAME          ���ϐ��̎擾(���{�ԃT�[�o�[)
@rem   DESCRIPTION   Waha!�v���O����(�������͂���ɕt������v���O����)�Ŏg�p������ϐ����擾
@rem   CODED BY      2010/05/26 1.0.0 ZBS  �o�_ �V�K�쐬
@rem   CHANGED BY    2010/06/17 1.0.1 ZBS  �o�_ No.31 ����^�p�`�o�k�p�X�ANo.32 ���Ɩ��`�o�k�p�X�̒ǉ�
@rem                 2010/06/17 1.0.2 ZBS  �o�_ �v���O�����R�����g�̒ǉ�
@rem                 2010/09/13 1.1.0 �����V�X�e����  ���� ���ϐ��̒ǉ�
@rem                                                       No.33 �Q�������������ANo.34 �W������������
@rem                 2011/03/31 1.1.1 �����V�X�e����  ���� ���ϐ��̒ǉ�
@rem                                                       No.35 �o�b���
@rem                 2011/04/14 1.1.2 �����V�X�e����  ���� ���ϐ��̒ǉ�
@rem                                                       No.36 �R�����O������
@rem                                                       No.37 �R�����O������
@rem                 2014/01/30 1.1.3 �O�������f�o  ���� ���ϐ��̒ǉ�
@rem                                                       No.38 ����^�p�h���C�u
@rem                 2016/06/27 1.1.4 �O�������f�o  �ː� �T�[�o�[�X���Ή�
@rem                                                       �T�[�o�[���̕ύX IWTUSRC1=>IWTUSRC2
@rem -------------------------------------------------------------------------------------------------------------------

@ECHO OFF

REM ���ϐ� No.10,30,38  �����ˑ����
SET ���R�[�h=03
SET SYS=IWT
SET ����^�p�h���C�u=D

REM �ڑ���T�[�o�[�����o�b�`�t�@�C����(����8����)����擾
SET DBSERVER=%~n0
SET DBSERVER=%DBSERVER:~-8,8%

REM ���ϐ� No.1
SET S1=SELECT t1.[�{���c�Ɠ�]                     AS ������
SET F1=  FROM JSPDBN002..KNSCMDT0 t1
SET SQL=set nocount on;%S1%%F1%
echo 1
IF NOT "%1"=="" (
  SET ������=%1
) ELSE (
  FOR /F "skip=2 tokens=1," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
    SET ������=%%a
    echo aaa
    echo %������%
  )
)
echo 2
REM ���ϐ� No.2,3,4,5,6,7,8,9,24,25,26,27
SET S1=SELECT t2.[�P���O������]                   AS ���,
SET S2=       t2.[�P�����O������]                 AS �������,
SET S3=       Left(t2.[�P�����O������], 6) + '01' AS ��������̌�����,
SET S4=       Left(t2.[�P�����O������], 6)        AS ������N��,
SET S5=       t3.[�������c�Ɠ�]                   AS ���������c�Ɠ�,
SET S6=       t2.[�Q�����O������]                 AS �O���������,
SET S7=       Left(t2.[�Q�����O������], 6)        AS �O��������N��,
SET S8=       t2.[��������]                       AS �����������,
SET S9=       t2.[�Q���O������]                   AS [�P���O���],
SET S10=      t2.[�R���O������]                   AS [�Q���O���],
SET S11=      t2.[�S���O������]                   AS [�R���O���],
SET S12=      t2.[�W���O������]                   AS [�V���O���],
SET S13=      Left(t2.[�R�����O������], 6) + '01' AS [�R�����O������],
SET S14=      t2.[�R�����O������]                 AS [�R�����O������]
SET F1=  FROM %SYS%DBN001..TCBKY001_���ʓ��t��� t2,
SET F2=       %SYS%DBN001..TCBKY001_���ʓ��t��� t3
SET W1= WHERE t2.[������] = %������%
SET W2=   AND t3.[������] = t2.[�P�����O������]
SET SQL=set nocount on;%S1%%S2%%S3%%S4%%S5%%S6%%S7%%S8%%S9%%S10%%S11%%S12%%S13%%S14%%F1%%F2%%W1%%W2%
FOR /F "skip=2 tokens=1-14," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
  SET ���=%%a
  SET �������=%%b
  SET ��������̌�����=%%c
  SET ������N��=%%d
  SET ���������c�Ɠ�=%%e
  SET �O���������=%%f
  SET �O��������N��=%%g
  SET �����������=%%h
  SET �P���O���=%%i
  SET �Q���O���=%%j
  SET �R���O���=%%k
  SET �V���O���=%%l
  SET �R�����O������=%%m
  SET �R�����O������=%%n
  SET �o�b���=%%a
)
echo 3
REM ���ϐ� No.11,12,13,14,15
SET ���o�̓t�H���_�p�X=D:\%SYS%_DATA
SET ���ԃt�H���_�p�X=W:\%SYS%_TEMP
SET �Ɩ����ʂ`�o�k�p�X=D:\%SYS%_APL\�Ɩ�����\BAT
SET �Ҍ��f�[�^�t�H���_�p�X=D:\DATA_OUT
SET �A�v���P�[�V�����t�H���_�p�X=D:\%SYS%_APL

REM ���ϐ� No.16,17,18,19,20,21,22,23
SET ���t�`�F�b�N����=D:\JSP_APL\JSP_CMS\BIN\JCMBS501.exe
SET ����a��ϊ�����=D:\JSP_APL\JSP_CMS\BIN\JCMBS502.exe
SET �����v�Z����=D:\JSP_APL\JSP_CMS\BIN\JCMBS503.exe
SET �����v�Z����=D:\JSP_APL\JSP_CMS\BIN\JCMBS504.exe
SET �������Z�o����=D:\JSP_APL\JSP_CMS\BIN\JCMBS505.exe
SET �������Z�o����=D:\JSP_APL\JSP_CMS\BIN\JCMBS506.exe
SET ���t�`�F�b�N�����Q=D:\JSP_APL\JSP_CMS\BIN\JCMBS507.exe
SET �f�v�W�M�t�@�C���p�X=E:\BGW\Data\Shushin\S1_PreCodeSave

REM ���ϐ� No.28,29,31,32
SET ���[�쐬�`�o�k�p�X=D:\%SYS%_APL\���[�쐬\BAT
SET �i�`�Ҍ��f�[�^�`�o�k�p�X=D:\%SYS%_APL\�i�`�Ҍ��f�[�^\BAT
SET ����^�p�`�o�k�p�X=D:\%SYS%_APL\����^�p\BAT
SET ���Ɩ��`�o�k�p�X=D:\%SYS%_APL\���Ɩ�\BAT
echo ab
REM ���ϐ� No.33,34
REM �x�����ϐ��̓W�J��L���ɂ���
REM setlocal enabledelayedexpansion
SET S1=SELECT t2.[������]                     AS ������,
SET S2=       t2.[�j���敪]                   AS �j���敪,
SET S3=       t2.[�P����c�Ɠ�]               AS �T���c�Ɠ�
SET F1=  FROM %SYS%DBN001..TCBKY001_���ʓ��t��� t2
SET W1= WHERE SUBSTRING(t2.[������], 1, 6) = SUBSTRING('%������%', 1, 4) + '02'
SET W2=   AND t2.[�j���敪] = '1'
SET O1= ORDER BY t2.[������] 
SET SQL=set nocount on;%S1%%S2%%S3%%F1%%W1%%W2%%O1%
echo cd
SET /a COUNT=0
echo %SQL%
FOR /F "skip=2 tokens=1-3," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
  SET /a COUNT=COUNT+1
  IF !COUNT!==2 SET �Q������������=%%c 
  echo %COUNT%
  echo %�Q������������%
)
echo 4
SET S1=SELECT t2.[������]                     AS ������,
SET S2=       t2.[�j���敪]                   AS �j���敪,
SET S3=       t2.[�P����c�Ɠ�]               AS �T���c�Ɠ�
SET F1=  FROM %SYS%DBN001..TCBKY001_���ʓ��t��� t2
SET W1= WHERE SUBSTRING(t2.[������], 1, 6) = SUBSTRING('%������%', 1, 4) + '08'
SET W2=   AND t2.[�j���敪] = '1'
SET O1= ORDER BY t2.[������] 
SET SQL=set nocount on;%S1%%S2%%S3%%F1%%W1%%W2%%O1%
SET /a COUNT=0
FOR /F "skip=2 tokens=1-3," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
  SET /a COUNT=!COUNT!+1
  IF !COUNT!==2 SET �W������������=%%c 
)
echo 5
REM �g�p�ς݊��ϐ��̃N���A
SET DBSERVER=
SET S1=
SET S2=
SET S3=
SET S4=
SET S5=
SET S6=
SET S7=
SET S8=
SET S9=
SET S10=
SET S11=
SET S12=
SET S13=
SET S14=
SET F1=
SET F2=
SET W1=
SET W2=
SET SQL=
SET O1=
echo last
