;����						���첨
;����						2012��01��
!define						PRODUCT_NAME "Windows ϵͳ������ ��ʽ��׼��"
!define 					PRODUCT_VERSION "2.0.2012.62"
!define 					PRODUCT_PUBLISHER "���������첨"
!define						PRODUCT_WEB_SITE "http://weibo.com/xiaobo58/"
!define 					APPWEBSITE "http://weibo.com/xiaobo58/"
!define 					MUI_ICON "E:\DisplayIcon.ICO"
!define 					VERSION_MAJOR 2
!define		 				VERSION_MINOR 0201262
!define 					MUI_ABORTWARNING_TEXT "���Ƿ�Ҫȡ����������"
!define						MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "������Ŀ��ϸ����"
!include					"MUI.nsh"
!include					"x64.nsh"
!include					"Sections.nsh"
InstallDir					"c:\"
OutFile						"CleanV2RC_STD.exe"
Caption 					"Windows ϵͳ������ RC���԰�"
Name 						"Windows ϵͳ������ RC���԰�"
RequestExecutionLevel 		user
XPStyle						on
WindowIcon					off
ShowInstDetails				show
SetCompressor /SOLID		lzma
SetCompressorDictSize		64
SetDatablockOptimize		on

Function GetWindowsVersion
   Push $R0
   Push $R1
   ClearErrors
   ReadRegStr $R0 HKLM \
   "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion
   IfErrors 0 lbl_winnt
   ; If NOT NT SYSTEM,THEN
   ReadRegStr $R0 HKLM \
   "SOFTWARE\Microsoft\Windows\CurrentVersion" VersionNumber
   StrCpy $R1 $R0 1
   StrCmp $R1 '4' 0 lbl_error
   StrCpy $R1 $R0 3
   StrCmp $R1 '4.0' lbl_win32_95
   StrCmp $R1 '4.9' lbl_win32_ME lbl_win32_98
   lbl_win32_95:
     StrCpy $R0 '95'
   Goto lbl_done
   lbl_win32_98:
     StrCpy $R0 '98'
   Goto lbl_done
   lbl_win32_ME:
     StrCpy $R0 'ME'
   Goto lbl_done
   lbl_winnt:
   StrCpy $R1 $R0 1
   StrCmp $R1 '3' lbl_winnt_x
   StrCmp $R1 '4' lbl_winnt_x
   StrCpy $R1 $R0 3
   StrCmp $R1 '5.0' lbl_winnt_2000
   StrCmp $R1 '5.1' lbl_winnt_XP
   StrCmp $R1 '5.2' lbl_winnt_2003
   StrCmp $R1 '6.0' lbl_winnt_vista lbl_error
   lbl_winnt_x:
   StrCpy $R0 "NT $R0" 6
   Goto lbl_done
   lbl_winnt_2000:
   Strcpy $R0 '2000'
   Goto lbl_done
   lbl_winnt_XP:
     Strcpy $R0 'XP'
   Goto lbl_done
   lbl_winnt_2003:
     Strcpy $R0 '2003'
   Goto lbl_done
   lbl_winnt_vista:
     Strcpy $R0 'Vista'
   Goto lbl_done
    lbl_error:
     Strcpy $R0 ''
   lbl_done:
   Pop $R1
   Exch $R0
FunctionEnd

  !define MUI_ABORTWARNING
  !define MUI_WELCOMEFINISHPAGE_BITMAP "R\A.bmp"
  !define MUI_WELCOMEFINISHPAGE_BITMAP_NOSTRETCH
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "R\B.bmp" 
/*  !define MUI_COMPONENTSPAGE_SMALLDESC*/
  !define MUI_WELCOMEPAGE_TEXT "ʹ�ô�����ɿ��ٰ�ȫɾ��ϵͳ�еĸ���ϵͳ������\r\n\r\n����������� ��ӵ�ж෽λ������ʽ���ر𵱽��ʺϸ��и�ҵ�ĵ��Թ�����Ա�������ڵ��������ĸ�������� Windows 32 �� 64 λ����ϵͳ��\r\n\r\n���������첨 ���ڣ�2012��01�£�ף���������֣�\r\n\r\nע�⣺�˰汾Ϊ�����棬���߽�����������С��Χ�ڹ���ʹ�ã����ڰ汾ԭ�򲻿ɴ����ʹ�á�Υ�߱ؾ���"
  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_LANGUAGE "SimpChinese"
  VIProductVersion "2.0.2012.62"
  VIAddVersionKey /LANG=${1033-English} "ProductName" "Windows ϵͳ������ 2012�����ر�� ��ʽ��׼��"
  VIAddVersionKey /LANG=${1033-English} "Comments" "���������첨 2012��01��22�� ������ ũ��2011�������ʮ 18:00 (GMT+8) E��Mail:zhouxiaobo.500@163.com ף���¥�꼪�飬�Ҹ�������"
  VIAddVersionKey /LANG=${1033-English} "CompanyName" "���첨"
  VIAddVersionKey /LANG=${1033-English} "LegalTrademarks" "Windows ϵͳ������ ��ʽ��׼��"
  VIAddVersionKey /LANG=${1033-English} "LegalCopyright" "Copyright (C) 2009-2012 by ���첨"
  VIAddVersionKey /LANG=${1033-English} "FileDescription" "�򵥿��ٵ�ϵͳ�����ߣ���������ϵͳ�������������ȹ��ܡ�"
  VIAddVersionKey /LANG=${1033-English} "FileVersion" "2.0.2012.62"
  VIAddVersionKey /LANG=${1033-English} "Applies to" "Microsoft(R) Windows (R) 2000 Or Higher System."
  VIAddVersionKey /LANG=${1033-English} "Build Date " "2012/01/22 Sun 18:00 PM (GMT+8)"
  VIAddVersionKey /LANG=${1033-English} "Installation Type" "Custom Type"
  VIAddVersionKey /LANG=${1033-English} "Installer Engine" "ZHOUXIAOBO_SYSTEMCLEAN_ALPHAEDITION_Standard.exe"
  VIAddVersionKey /LANG=${1033-English} "Installer Version" "2.0.2012.62"
  VIAddVersionKey /LANG=${1033-English} "���첨" "ԭ�����������첨�������첨�����������ɫ�޶����������ã���л���İ�װ��My Sina MicroBlog(@�Ϻ�����������)��http://weibo.com/xiaobo58/  Personal Electronic Mail:zhouxiaobo.500@163.com ��zhouxiaobo500@hotmail.com"
  VIAddVersionKey /LANG=${1033-English} "Package Type" "LZMA:26"
  VIAddVersionKey /LANG=${1033-English} "Proc. Architecture" "x86&x64"
  VIAddVersionKey /LANG=${1033-English} "Support Link" "@�Ϻ����������ӣ�http://weibo.com/xiaobo58/ "  
  VIAddVersionKey /LANG=${1033-English} "SetupDigitalSign" "SYSTEMCLEANHELPER(STDEDITION)[2012SPECIALEDITION]_V2.0.2012.62"
  
  Function .onInit
	Call GetWindowsVersion
	Pop $R0
	StrCmp $R0 "95" 0 +3
		MessageBox MB_OK "�Բ�����ʹ�õ�ϵͳ�������൱���š���������ϵͳ�������ԣ������޷�������ϵͳ��������������������½⣡$\n�Ƽ�����ʹ�ø����µĵ��Լ�ϵͳ�Լ�ʱ����ʱ���Ĳ���������ע�⣺���ڲ�û�й�������֧������ϵͳ���⽫��ʹ���ĵ��Բ���������Ѳ���ȱ�����ߵİ�ȫ�ԡ� ������ͨ���������ַ�ʽ��ϵ�������첨$\n1��ʹ������΢�� @�Ϻ�����������.http://weibo.com/xiaobo58/$\n2���������ڰٶ�֪������zhouxiaobo500������$\n3��ֱ�Ӹ����첨�����ö���zhouxiaobo.500@163.com �� zhouxiaobo500@hotmail.com$\n$\n�ǳ��ڴ�����ʱ�ķ�����лл����"
		Abort
	StrCmp $R0 "98" 0 +3
		MessageBox MB_OK "�Բ�����ʹ�õ�ϵͳ�������൱���š���������ϵͳ�������ԣ������޷�������ϵͳ��������������������½⣡$\n�Ƽ�����ʹ�ø����µĵ��Լ�ϵͳ�Լ�ʱ����ʱ���Ĳ���������ע�⣺���ڲ�û�й�������֧������ϵͳ���⽫��ʹ���ĵ��Բ���������Ѳ���ȱ�����ߵİ�ȫ�ԡ� ������ͨ���������ַ�ʽ��ϵ�������첨$\n1��ʹ������΢�� @�Ϻ�����������.http://weibo.com/xiaobo58/$\n2���������ڰٶ�֪������zhouxiaobo500������$\n3��ֱ�Ӹ����첨�����ö���zhouxiaobo.500@163.com �� zhouxiaobo500@hotmail.com$\n$\n�ǳ��ڴ�����ʱ�ķ�����лл����"
		Abort
	StrCmp $R0 "ME" 0 +3
		MessageBox MB_OK "�Բ�����ʹ�õ�ϵͳ�������൱���š���������ϵͳ�������ԣ������޷�������ϵͳ��������������������½⣡$\n�Ƽ�����ʹ�ø����µĵ��Լ�ϵͳ�Լ�ʱ����ʱ���Ĳ���������ע�⣺���ڲ�û�й�������֧������ϵͳ���⽫��ʹ���ĵ��Բ���������Ѳ���ȱ�����ߵİ�ȫ�ԡ� ������ͨ���������ַ�ʽ��ϵ�������첨$\n1��ʹ������΢�� @�Ϻ�����������.http://weibo.com/xiaobo58/$\n2���������ڰٶ�֪������zhouxiaobo500������$\n3��ֱ�Ӹ����첨�����ö���zhouxiaobo.500@163.com �� zhouxiaobo500@hotmail.com$\n$\n�ǳ��ڴ�����ʱ�ķ�����лл����"
		Abort
  InitPluginsDir   
  System::Call 'kernel32::CreateMutexA(i 0, i 0, t "nsis_chs_installer") i .r1 ?e'
  Pop $R0
  StrCmp $R0 0 +3
    MessageBox MB_OK|MB_ICONEXCLAMATION "��һ���������������У������Ժ��ٲ�����"
    Abort
  FunctionEnd
  
/*Section ""  CLEAN

SectionEnd

Section ""  CLEAN

SectionEnd

Section ""  CLEAN

SectionEnd*/

SectionGroup "ϵͳһ������" NOR
Section "!����ɾ��" STANDARDCLEAN
  SectionIn RO
  SetDetailsPrint textonly
  DetailPrint "��������๤��......"
  SetDetailsPrint listonly
  Delete $TEMP\*.*
  RMDir /r "$TEMP"
  Delete $WINDIR\TEMP\*.*
  Delete $APPDATA\Local\Temp\*.*																						/*������Ŀ��WIN7�����¼��룬���ܹ� Vista/7ϵͳ��������*/
  RMDir /r "$APPDATA\Local\Temp"																						/*���������ڡ��û���ʱ�ļ���*/
  RMDir /r "$WINDIR\TEMP"
  SetOutPath "$WINDIR\TEMP"
  Delete $WINDIR\system32\FNTCACHE.DAT																					/*Widnwos ���建��*/
SectionEnd
SectionGroupEnd

SectionGroup "ϵͳ�߼�����" HIGHCLASS
Section "!���жԻ�����ʷ��¼"  RUNCLEAN
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
SectionEnd
Section "!����Ĵ��ĵ���ʷ��¼"  RECENTCLEAN
  Delete $RECENT\*.*
  RMDir /r "$RECENT"
  Delete $APPDATA\Microsoft\Office\Recent\*.*
  Delete $APPDATA\Microsoft\Word\*.wbk
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"										/*���¼����� WINXP �����ڼ���*/
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\TrayNotify"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List"
  DeleteRegKey HKCU "Software\Microsoft\Windows\ShellNoRoam\MUICache"
  DeleteRegKey HKCU "Software\Microsoft\Internet Explorer\TypedURLs"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.flac"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.flv"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.ini"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.jpg"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.nsi"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.ppt"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.zip"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.avi"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.jpeg"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.gif"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.tif"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.c"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.h"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.doc"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.docx"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.pptx"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.htm"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.html"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.asp"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.aspx"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.php"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.png"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.inf"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.dat"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.ico"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.url"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.bmp"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.nsh"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.f"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.for"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.f90"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.f95"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.f2k"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.tex"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.sql"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.nfo"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.mak"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.rc"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.as"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.mx"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.vb"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.vbs"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.js"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.sh"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.bsh"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.lua"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.pl"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.pm"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.py"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.mhtml"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.phtml"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.jsp"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.css"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.xml"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.config"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.java"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.cs"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.pas"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.inc"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.log"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.hpp"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.hxx"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.cpp"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.cxx"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.cc"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.m"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.java"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.cs"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.pas"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.inc"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\Folder"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\Folder"
  
  
SectionEnd
Section /o "Windows ��ͼ��д�ְ���ʷ��¼"  PAINTCLEAN
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List"
SectionEnd
Section /o "Windows Ԥ������־���ڴ�ת������ʼ�˵����ļ�"  MEMCLEAN
  Delete $WINDIR\Prefetch\*.db
  Delete $WINDIR\Prefetch\*.pf
  Delete $WINDIR\Prefetch\*.*
  Delete $WINDIR\Minidump\*.dmp
  Delete $WINDIR\Minidump\*.*
  Delete $WINDIR\PFRO.LOG
  Delete $WINDIR\setupact.log
  Delete $WINDIR\setuperr.log
  Delete $WINDIR\WindowsUpdate.log
  Delete $WINDIR\WmFirewall.log
  Delete $WINDIR\Logs\*.*
  Delete $WINDIR\debug\*.*
  RMDir /r "$WINDIR\Logs"
  RMDir /r "$WINDIR\debug"
  Delete $WINDIR\Microsoft.NET\Framework\v2.0.50727\ngen_service.log
  Delete $WINDIR\Microsoft.NET\Framework\v4.0.30319\ngen.log
  Delete $WINDIR\Microsoft.NET\Framework\v4.0.30319\ngen_service.log
  SetOutPath "$WINDIR\Logs"
  SetOutPath "$WINDIR\debug"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu2\Programs\��Ӱħ����"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu2\Programs\AVG 2012"
  
SectionEnd
Section "Windows ����ͼ����"  PICCLEAN
  Delete $APPDATA\Local\Microsoft\Windows\Explorer\*.*
  RMDir /r "$APPDATA\Local\Microsoft\Windows\Explorer"
SectionEnd

Section "Office �������ʷ��¼"  OFFICESOFTCLEAN

SectionEnd


Section "Windows ���󱨸�"  ERRORLOGCLEAN   
  Delete $APPDATA\AppData\Local\Microsoft\Windows\WER\*.*
  RMDir /r "$APPDATA\AppData\Local\Microsoft\Windows\WER"
SectionEnd
Section "Windows �Զ����»���"  AUPDATECLEAN
  Delete $WINDIR\SoftwareDistribution\Download\*.*
  RMDir /r "$WINDIR\SoftwareDistribution\Download"
SectionEnd
Section "������������(��������վ)"  HIGHCLEAN
    RMDir /r "A:\Recycler"
    RMDir /r "B:\Recycler"
    RMDir /r "C:\Recycler"
    RMDir /r "D:\Recycler"
    RMDir /r "E:\Recycler"
    RMDir /r "F:\Recycler"
    RMDir /r "G:\Recycler"
    RMDir /r "H:\Recycler"
    RMDir /r "I:\Recycler"
    RMDir /r "J:\Recycler"
    RMDir /r "K:\Recycler"
    RMDir /r "L:\Recycler"
    RMDir /r "M:\Recycler"
    RMDir /r "N:\Recycler"
    RMDir /r "O:\Recycler"
    RMDir /r "P:\Recycler"
    RMDir /r "Q:\Recycler"
    RMDir /r "R:\Recycler"
    RMDir /r "S:\Recycler"
    RMDir /r "T:\Recycler"
    RMDir /r "U:\Recycler"
    RMDir /r "V:\Recycler"
    RMDir /r "W:\Recycler"
    RMDir /r "X:\Recycler"
    RMDir /r "Y:\Recycler"
    RMDir /r "Z:\Recycler"
    RMDir /r "C:\PerfLogs\System\Diagnostics"
    RMDir /r "D:\PerfLogs\System\Diagnostics"
    RMDir /r "E:\PerfLogs\System\Diagnostics"
    RMDir /r "F:\PerfLogs\System\Diagnostics"
    RMDir /r "G:\PerfLogs\System\Diagnostics"
    RMDir /r "H:\PerfLogs\System\Diagnostics"
SectionEnd
SectionGroupEnd

SectionGroup "���������" BR
Section /o "!IE�����"  IECLEAN
/*rundll32.exe C:\Windows\system32\inetcpl.cpl,ClearMyTracksByProcess Flags:8395 WinX:160 WinY:147 IEFrame:00000000 ExecShell "open" "$WINDIR\System32\inetcpl.cpl"*/
  Delete $INTERNET_CACHE\Content.IE5\*.*
  Delete $INTERNET_CACHE\*.*
  RMDir /r "$INTERNET_CACHE\Content.IE5"
  RMDir /r "$INTERNET_CACHE"
  DeleteRegKey HKCU "Software\Microsoft\Internet Explorer\TypedURLs"
  Delete $HISTORY\*.*
  RMDir /r "$HISTORY"
  /*Delete $APPDATA\AppData\Local\Microsoft\Internet Explorer\brndlog.bak*/
SectionEnd
Section /o "!IE������� Cookies"  IECOOK
  Delete $COOKIES\*.*
  RMDir /r "$COOKIES"
SectionEnd
Section /o "Mozilla Firefox�����"  FOXCLEAN
  Delete $APPDATA\Mozilla\Firefox\Profiles\*.*
  RMDir /r "$APPDATA\Mozilla\Firefox\Profiles"
SectionEnd
SectionGroupEnd
SectionGroup "ϵͳ�������" THINPC
Section "!ϵͳ��������"  DRIVERCLEAN
 Delete "$WINDIR\Driver Cache\*.*"
 RMDir /r "$WINDIR\Driver Cache"
SectionEnd
Section /o "������뷨"  CANGJIECLEAN
 RMDir /r $WINDIR\IME\CINTLGNT
 RMDir /r $WINDIR\System32\IME\CINTLGNT
SectionEnd
Section /o "�������뷨"  HANCLEAN
 RMDir /r $WINDIR\IME\imekr8
 RMDir /r $WINDIR\System32\IME\imekr8
SectionEnd
Section /o "!�������뷨"  JANCLEAN
 RMDir /r $WINDIR\IME\IMEJP10
 RMDir /r $WINDIR\System32\IME\IMEJP10
SectionEnd
Section /o "��ɾ���Ĵ�����ۼ����ָ�뷽��"  CHUANGTICLEAN
  DeleteRegKey HKCU "Control Panel\Appearance\Schemes"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Cursors\Schemes"
SectionEnd
Section /o "��ɾ������������"  LANGUAGECLEAN
  DeleteRegKey HKLM "SYSTEM\CurrentControlSet\Control\Nls\Locale"
SectionEnd
Section /o "��ɾ��������ʱ��"  TIMEZONECLEAN
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Afghanistan Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Alaskan Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Arab Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Arabian Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Arabic Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Argentina Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Atlantic Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\AUS Central Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\AUS Eastern Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Azerbaijan Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Azores Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Bangladesh Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Canada Central Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Cape Verde Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Caucasus Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Cen. Australia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central America Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central Asia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central Brazilian Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central Europe Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central European Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central Pacific Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Central Standard Time (Mexico)"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Dateline Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\E. Africa Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\E. Australia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\E. Europe Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\E. South America Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Egypt Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Ekaterinburg Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Fiji Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\FLE Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Georgian Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Greenland Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\GTB Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Hawaiian Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\India Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Iran Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Israel Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Jordan Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Kamchatka Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Korea Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Magadan Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mauritius Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mid-Atlantic Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Middle East Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Montevideo Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Morocco Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mountain Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mountain Standard Time (Mexico)"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Myanmar Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\N. Central Asia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Namibia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Nepal Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\New Zealand Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Newfoundland Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\North Asia East Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\North Asia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Pacific SA Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Pacific Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Pacific Standard Time (Mexico)"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Pakistan Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Paraguay Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Romance Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Russian Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\SA Eastern Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\SA Pacific Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\SA Western Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Samoa Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Sri Lanka Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Syria Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Tasmania Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Tokyo Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Tonga Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Ulaanbaatar Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\US Eastern Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\US Mountain Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\UTC"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\UTC+12"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\UTC-02"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\UTC-11"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Venezuela Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Vladivostok Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\W. Australia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\W. Central Africa Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\W. Europe Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\West Asia Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\West Pacific Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Yakutsk Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Bahia Standard Time"							/*��WINXP�����¼���*/
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Kaliningrad Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mexico Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mexico Standard Time 2"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\South Africa Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Turkey Standard Time"
  
SectionEnd
Section /o "��ɾ����Internet���Һ͵�������"  INTERNETCODECLEAN
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\101"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\102"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\103"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\104"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\105"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\106"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\108"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\109"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\110"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\111"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\112"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\113"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\115"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\116"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\117"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\118"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\121"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\122"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\123"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\124"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\20"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\212"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\213"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\216"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\218"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\220"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\221"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\222"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\223"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\224"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\225"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\226"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\227"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\228"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\229"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\230"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\231"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\232"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\233"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\234"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\235"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\236"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\237"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\238"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\239"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\240"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\241"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\242"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\243"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\244"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\245"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\246"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\247"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\248"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\249"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\250"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\251"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\252"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\253"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\254"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\255"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\256"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\257"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\258"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\260"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\261"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\262"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\263"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\264"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\265"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\266"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\267"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\268"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\269"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\2691"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\290"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\291"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\297"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\298"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\299"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\30"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\31"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\32"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\33"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\34"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\350"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\351"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\352"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\353"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\354"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\355"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\356"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\357"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\358"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\359"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\36"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\370"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\371"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\372"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\373"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\374"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\375"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\376"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\377"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\378"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\379"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\380"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\381"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\382"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\385"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\386"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\387"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\389"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\39"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\40"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\41"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\420"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\421"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\423"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\43"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\441"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\442"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\443"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\444"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\45"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\46"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\47"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\471"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\48"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\49"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\500"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\501"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\502"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\503"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\504"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\505"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\506"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\507"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\508"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\509"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\51"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\52"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\53"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\5399"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\5901"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\54"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\55"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\56"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\57"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\58"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\590"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\591"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\592"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\593"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\594"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\595"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\596"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\597"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\598"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\599"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\60"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\6101"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\6102"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\66"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\670"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\6701"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\6702"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\6703"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\6704"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\672"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\6721"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\673"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\674"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\675"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\676"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\677"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\678"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\679"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\680"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\681"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\682"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\683"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\684"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\685"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\686"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\687"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\688"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\689"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\690"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\691"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\692"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\7"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\705"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\800"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\81"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\82"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\84"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\850"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\855"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\856"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\870"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\871"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\872"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\873"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\874"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\880"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\90"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\91"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\92"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\93"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\94"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\95"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\960"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\961"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\962"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\963"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\964"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\965"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\966"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\967"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\968"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\970"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\971"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\972"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\973"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\974"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\975"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\976"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\977"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\98"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\992"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\993"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\994"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\995"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\996"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Telephony\Country List\998"
SectionEnd
SectionGroupEnd
SectionGroup "�����������" SOFTCLEAN
Section "!Flash Player"  FLASHCLEAN
  Delete "$APPDATA\Macromedia\Flash Player\*.*"
  RMDir /r "$APPDATA\Macromedia\Flash Player"
  Delete "$APPDATA\Adobe\Flash Player\*.*"
  RMDir /r "$APPDATA\Adobe\Flash Player"
SectionEnd
Section "!ʹ�ó������ʱ��������ʷ��¼�������ļ�"  SOFTFILECLEAN
  DeleteRegKey HKCR "Applications\wps.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\wpp.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\ET.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\Photoshop.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\nEOKanKan.exe\shell\Open\command"
  DeleteRegKey HKCR "Applications\Fireworks.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\dreamweaver.exe\shell\Open\command"
  DeleteRegKey HKCR "Applications\conew.exe\shell\open\command"
  RMDir /r "$PROGRAMFILES\KSafe\hotfix"
  RMDir /r "$APPDATA\AIRPLAY\CACHE"
  RMDir /r "$APPDATA\Kingsoft\kclear\temp"
  Delete "$APPDATA\Microsoft\Word\*.wbk"
SectionEnd
SectionGroupEnd

  LangString 	  	DESC_NOR							${LANG_SimpChinese}				"ϵͳ������һ��������������ģ�"
  LangString 	  	DESC_SOFTFILECLEAN					${LANG_SimpChinese}				"�������һЩ����������ļ�����ʷ��¼��ʹ�ü�¼�ȵȡ���������ɱ��������������ݡ�"
  LangString 	  	DESC_SOFTCLEAN						${LANG_SimpChinese}				"ϵͳ��װ�ĳ����������������ͬ�����������ɽ��ʿ���ز�������ʱ�ļ�����Ҫ��װ��Ĭ��Ŀ¼������������ɱ��������������ݡ�"
  LangString 	  	DESC_DRIVERCLEAN					${LANG_SimpChinese}				"����ϵͳ�Դ�����������ɾ������ܻ����ĳЩ�����޷����ء�"
  LangString 	  	DESC_FLASHCLEAN						${LANG_SimpChinese}				"������� Flash Player ����ʷ��¼�Լ�������ϵͳ�ڵ� Flash �������Ϸ�Ľ��ȡ�����ȵȡ�"
  LangString 	  	DESC_HIGHCLEAN						${LANG_SimpChinese}				"��������ϵͳ����վ(����˼�����С�����Щ�ļ�����ɾ���������ֹ�ɾ��)�Լ�����ɢ���ڸ��ص������ļ������Կɰ�ȫɾ����"
  LangString 	 	DESC_STANDARDCLEAN				 	${LANG_SimpChinese} 			"�����й�ϵͳ����ʱ�ļ���"
  LangString 	 	DESC_THINPC							${LANG_SimpChinese}				"����� Windows ϵͳ�������������һЩ���š����õ�ϵͳ���ܡ�"
  LangString		DESC_BR								${LANG_SimpChinese}				"������������ۼ�������������桢��ʷ��¼"
  LangString  		DESC_OFFICESOFTCLEAN				${LANG_SimpChinese}				"���� Microsoft Office ϵ������Ĵ��ļ���ʷ��¼�����ڰ칫�ҹ�����Ա�����鶨������"
  LangString  		DESC_IECLEAN						${LANG_SimpChinese}				"���� IE ������������¼�������� Cookies[һ���ı��ĵ������ڷ����û����������û�����������ٵ�¼��վ��������ײ�����ȫ���⡣]"
  LangString  		DESC_IECook							${LANG_SimpChinese}				"���� IE ���������� Cookies��"
  LangString  		DESC_PICCLEAN						${LANG_SimpChinese}				"Windows ����ͼ������Լӿ����ͼƬʱ���ٶȡ�����������ж�������Ļ��������Դ���ռ�ô��̿ռ䡣����������ͷ�ϵͳ�ռ䣡"
  LangString  		DESC_ERRORLOGCLEAN					${LANG_SimpChinese}				"��ĳ����������˱�����Ƿ�����ʱ��ϵͳ���Զ����ɴ������󱨸档����������ͷŴ���ϵͳ�ռ䣡"
  LangString 		DESC_FOXCLEAN						${LANG_SimpChinese}				"���� Mozilla Firefox ������������¼��"
  LangString  		DESC_HIGHCLASS						${LANG_SimpChinese}				"ϵͳ�������ĸ���һ���������нϺõ���Ϣ�������ܡ�"
  LangString  		DESC_RUNCLEAN						${LANG_SimpChinese}				"�������жԻ����ڵ�����������ʷ��¼��"
  LangString   		DESC_RECENTCLEAN					${LANG_SimpChinese}				"����ϵͳ�е��ļ����ļ��С���ʷ��¼��"
  LangString   		DESC_PAINTCLEAN						${LANG_SimpChinese}				"����ϵͳ�Դ��Ļ�ͼ��д�ְ�����е���ʷ��¼��"
  LangString  		DESC_MEMCLEAN						${LANG_SimpChinese}				"����ϵͳ�Զ������Ԥ�����ڴ�ת����ϵͳ��־����ʼ�˵����ļ�����ʷ���ݡ�����������ͷŴ������̿ռ䣡"
  LangString		DESC_CANGJIECLEAN					${LANG_SimpChinese}		 		"����ϵͳ���Դ���΢�������뷨���Ƽ�ɾ�����汾̫�ã�"
  LangString		DESC_HANCLEAN						${LANG_SimpChinese}				"����ϵͳ���Դ���΢���ģ���������뷨��"
  LangString		DESC_JANCLEAN						${LANG_SimpChinese}				"����ϵͳ���Դ���΢���������뷨��"
  LangString		DESC_CHUANGTICLEAN					${LANG_SimpChinese}				"����ϵͳ�ڿ�ɾ���Ĵ�����ۼ����ָ�뷽��������ɾ�����������ã�"
  LangString		DESC_LANGUAGECLEAN					${LANG_SimpChinese}				"����ϵͳ�ڿ�ɾ�����������ԣ��ѱ���ϵͳ��������ݣ�����������������վ���ɰ�ȫɾ����"
  LangString		DESC_TIMEZONECLEAN					${LANG_SimpChinese}				"����ϵͳ�ڿ�ɾ��������ʱ�����ѱ���ϵͳ��������ݣ������������ʹ�õ�����ʱ�����ɰ�ȫɾ����"
  LangString		DESC_INTERNETCODECLEAN				${LANG_SimpChinese}				"����ϵͳ�ڿ�ɾ���� Internet ���Һ͵������루�ѱ���ϵͳ��������ݣ���������������������վ���ɰ�ȫɾ����"
  LangString		DESC_AUPDATECLEAN					${LANG_SimpChinese}				"Windows �ڽ��а�װ��������ʱ�ͷŵĻ����ļ�������������ͷŴ������̿ռ䣡"
  !insertmacro		MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro 		MUI_DESCRIPTION_TEXT				${NOR}							$(DESC_NOR)
  !insertmacro 		MUI_DESCRIPTION_TEXT				${OFFICESOFTCLEAN}				$(DESC_OFFICESOFTCLEAN)
  !insertmacro 		MUI_DESCRIPTION_TEXT				${DRIVERCLEAN}					$(DESC_DRIVERCLEAN)
  !insertmacro 		MUI_DESCRIPTION_TEXT				${SOFTFILECLEAN}				$(DESC_SOFTFILECLEAN)
  !insertmacro 		MUI_DESCRIPTION_TEXT				${SOFTCLEAN}					$(DESC_SOFTCLEAN)
  !insertmacro 		MUI_DESCRIPTION_TEXT				${FLASHCLEAN}					$(DESC_FLASHCLEAN)
  !insertmacro 		MUI_DESCRIPTION_TEXT				${HIGHCLEAN}					$(DESC_HIGHCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${BR}							$(DESC_BR)
  !insertmacro		MUI_DESCRIPTION_TEXT				${THINPC}						$(DESC_THINPC)
  !insertmacro		MUI_DESCRIPTION_TEXT				${STANDARDCLEAN}				$(DESC_STANDARDCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${IECLEAN}						$(DESC_IECLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${IECOOK}						$(DESC_IECOOK)
  !insertmacro		MUI_DESCRIPTION_TEXT				${PICCLEAN}						$(DESC_PICCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${CANGJIECLEAN}					$(DESC_CANGJIECLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${ERRORLOGCLEAN}				$(DESC_ERRORLOGCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${FOXCLEAN}						$(DESC_FOXCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${HIGHCLASS}					$(DESC_HIGHCLASS)
  !insertmacro		MUI_DESCRIPTION_TEXT				${RUNCLEAN}						$(DESC_RUNCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${RECENTCLEAN}					$(DESC_RECENTCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${PAINTCLEAN}					$(DESC_PAINTCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${MEMCLEAN}						$(DESC_MEMCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${HANCLEAN}						$(DESC_HANCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${JANCLEAN}						$(DESC_JANCLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${AUPDATECLEAN}					$(DESC_AUPDATECLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${CHUANGTICLEAN}				$(DESC_CHUANGTICLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${LANGUAGECLEAN}				$(DESC_LANGUAGECLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${TIMEZONECLEAN}				$(DESC_TIMEZONECLEAN)
  !insertmacro		MUI_DESCRIPTION_TEXT				${INTERNETCODECLEAN}			$(DESC_INTERNETCODECLEAN)
  !insertmacro		MUI_FUNCTION_DESCRIPTION_END
  BrandingText																			"ԭ���������������첨 Copyright (C) 2009-2012 By ���첨";EOF NOW