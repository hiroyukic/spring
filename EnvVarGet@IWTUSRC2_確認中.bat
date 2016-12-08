@rem -------------------------------------------------------------------------------------------------------------------
@rem   MODULE        EnvVarGet@IWTUSRC2
@rem   FILE          EnvVarGet@IWTUSRC2.bat
@rem   NAME          環境変数の取得(岩手本番サーバー)
@rem   DESCRIPTION   Waha!プログラム(もしくはそれに付随するプログラム)で使用する環境変数を取得
@rem   CODED BY      2010/05/26 1.0.0 ZBS  出雲 新規作成
@rem   CHANGED BY    2010/06/17 1.0.1 ZBS  出雲 No.31 制御運用ＡＰＬパス、No.32 県業務ＡＰＬパスの追加
@rem                 2010/06/17 1.0.2 ZBS  出雲 プログラムコメントの追加
@rem                 2010/09/13 1.1.0 共同システム課  藤原 環境変数の追加
@rem                                                       No.33 ２月利息元加日、No.34 ８月利息元加日
@rem                 2011/03/31 1.1.1 共同システム課  藤原 環境変数の追加
@rem                                                       No.35 ＰＣ基準日
@rem                 2011/04/14 1.1.2 共同システム課  藤原 環境変数の追加
@rem                                                       No.36 ３ヶ月前月初日
@rem                                                       No.37 ３ヶ月前月末日
@rem                 2014/01/30 1.1.3 三県共同ＧＰ  藤原 環境変数の追加
@rem                                                       No.38 制御運用ドライブ
@rem                 2016/06/27 1.1.4 三県共同ＧＰ  桐生 サーバー更改対応
@rem                                                       サーバー名の変更 IWTUSRC1=>IWTUSRC2
@rem -------------------------------------------------------------------------------------------------------------------

@ECHO OFF

REM 環境変数 No.10,30,38  ※環境依存情報
SET 県コード=03
SET SYS=IWT
SET 制御運用ドライブ=D

REM 接続先サーバー名をバッチファイル名(末尾8文字)から取得
SET DBSERVER=%~n0
SET DBSERVER=%DBSERVER:~-8,8%

REM 環境変数 No.1
SET S1=SELECT t1.[本日営業日]                     AS 処理日
SET F1=  FROM JSPDBN002..KNSCMDT0 t1
SET SQL=set nocount on;%S1%%F1%
echo 1
IF NOT "%1"=="" (
  SET 処理日=%1
) ELSE (
  FOR /F "skip=2 tokens=1," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
    SET 処理日=%%a
    echo aaa
    echo %処理日%
  )
)
echo 2
REM 環境変数 No.2,3,4,5,6,7,8,9,24,25,26,27
SET S1=SELECT t2.[１日前処理日]                   AS 基準日,
SET S2=       t2.[１ヶ月前月末日]                 AS 月末基準日,
SET S3=       Left(t2.[１ヶ月前月末日], 6) + '01' AS 月末基準日の月初日,
SET S4=       Left(t2.[１ヶ月前月末日], 6)        AS 月末基準年月,
SET S5=       t3.[当月末営業日]                   AS 月末窓口営業日,
SET S6=       t2.[２ヶ月前月末日]                 AS 前月月末基準日,
SET S7=       Left(t2.[２ヶ月前月末日], 6)        AS 前月月末基準年月,
SET S8=       t2.[当月末日]                       AS 翌月月末基準日,
SET S9=       t2.[２日前処理日]                   AS [１日前基準日],
SET S10=      t2.[３日前処理日]                   AS [２日前基準日],
SET S11=      t2.[４日前処理日]                   AS [３日前基準日],
SET S12=      t2.[８日前処理日]                   AS [７日前基準日],
SET S13=      Left(t2.[３ヶ月前月末日], 6) + '01' AS [３ヶ月前月初日],
SET S14=      t2.[３ヶ月前月末日]                 AS [３ヶ月前月末日]
SET F1=  FROM %SYS%DBN001..TCBKY001_共通日付情報 t2,
SET F2=       %SYS%DBN001..TCBKY001_共通日付情報 t3
SET W1= WHERE t2.[処理日] = %処理日%
SET W2=   AND t3.[処理日] = t2.[１ヶ月前月末日]
SET SQL=set nocount on;%S1%%S2%%S3%%S4%%S5%%S6%%S7%%S8%%S9%%S10%%S11%%S12%%S13%%S14%%F1%%F2%%W1%%W2%
FOR /F "skip=2 tokens=1-14," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
  SET 基準日=%%a
  SET 月末基準日=%%b
  SET 月末基準日の月初日=%%c
  SET 月末基準年月=%%d
  SET 月末窓口営業日=%%e
  SET 前月月末基準日=%%f
  SET 前月月末基準年月=%%g
  SET 翌月月末基準日=%%h
  SET １日前基準日=%%i
  SET ２日前基準日=%%j
  SET ３日前基準日=%%k
  SET ７日前基準日=%%l
  SET ３ヶ月前月初日=%%m
  SET ３ヶ月前月末日=%%n
  SET ＰＣ基準日=%%a
)
echo 3
REM 環境変数 No.11,12,13,14,15
SET 入出力フォルダパス=D:\%SYS%_DATA
SET 中間フォルダパス=W:\%SYS%_TEMP
SET 業務共通ＡＰＬパス=D:\%SYS%_APL\業務共通\BAT
SET 還元データフォルダパス=D:\DATA_OUT
SET アプリケーションフォルダパス=D:\%SYS%_APL

REM 環境変数 No.16,17,18,19,20,21,22,23
SET 日付チェック処理=D:\JSP_APL\JSP_CMS\BIN\JCMBS501.exe
SET 西暦和暦変換処理=D:\JSP_APL\JSP_CMS\BIN\JCMBS502.exe
SET 日数計算処理=D:\JSP_APL\JSP_CMS\BIN\JCMBS503.exe
SET 月数計算処理=D:\JSP_APL\JSP_CMS\BIN\JCMBS504.exe
SET 応答日算出処理=D:\JSP_APL\JSP_CMS\BIN\JCMBS505.exe
SET 応答月算出処理=D:\JSP_APL\JSP_CMS\BIN\JCMBS506.exe
SET 日付チェック処理２=D:\JSP_APL\JSP_CMS\BIN\JCMBS507.exe
SET ＧＷ集信ファイルパス=E:\BGW\Data\Shushin\S1_PreCodeSave

REM 環境変数 No.28,29,31,32
SET 帳票作成ＡＰＬパス=D:\%SYS%_APL\帳票作成\BAT
SET ＪＡ還元データＡＰＬパス=D:\%SYS%_APL\ＪＡ還元データ\BAT
SET 制御運用ＡＰＬパス=D:\%SYS%_APL\制御運用\BAT
SET 県業務ＡＰＬパス=D:\%SYS%_APL\県業務\BAT
echo ab
REM 環境変数 No.33,34
REM 遅延環境変数の展開を有効にする
REM setlocal enabledelayedexpansion
SET S1=SELECT t2.[処理日]                     AS 処理日,
SET S2=       t2.[曜日区分]                   AS 曜日区分,
SET S3=       t2.[１日後営業日]               AS 週初営業日
SET F1=  FROM %SYS%DBN001..TCBKY001_共通日付情報 t2
SET W1= WHERE SUBSTRING(t2.[処理日], 1, 6) = SUBSTRING('%処理日%', 1, 4) + '02'
SET W2=   AND t2.[曜日区分] = '1'
SET O1= ORDER BY t2.[処理日] 
SET SQL=set nocount on;%S1%%S2%%S3%%F1%%W1%%W2%%O1%
echo cd
SET /a COUNT=0
echo %SQL%
FOR /F "skip=2 tokens=1-3," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
  SET /a COUNT=COUNT+1
  IF !COUNT!==2 SET ２月利息元加日=%%c 
  echo %COUNT%
  echo %２月利息元加日%
)
echo 4
SET S1=SELECT t2.[処理日]                     AS 処理日,
SET S2=       t2.[曜日区分]                   AS 曜日区分,
SET S3=       t2.[１日後営業日]               AS 週初営業日
SET F1=  FROM %SYS%DBN001..TCBKY001_共通日付情報 t2
SET W1= WHERE SUBSTRING(t2.[処理日], 1, 6) = SUBSTRING('%処理日%', 1, 4) + '08'
SET W2=   AND t2.[曜日区分] = '1'
SET O1= ORDER BY t2.[処理日] 
SET SQL=set nocount on;%S1%%S2%%S3%%F1%%W1%%W2%%O1%
SET /a COUNT=0
FOR /F "skip=2 tokens=1-3," %%a IN ('sqlcmd -Q "%SQL%" -S %DBSERVER% -U sa -P sa') DO (
  SET /a COUNT=!COUNT!+1
  IF !COUNT!==2 SET ８月利息元加日=%%c 
)
echo 5
REM 使用済み環境変数のクリア
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
