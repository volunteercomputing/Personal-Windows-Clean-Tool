;制作						周潇波
;日期						2012年01月
!define						PRODUCT_NAME "Windows 系统清理工具 正式标准版"
!define 					PRODUCT_VERSION "2.0.2012.62"
!define 					PRODUCT_PUBLISHER "制作：周潇波"
!define						PRODUCT_WEB_SITE "http://weibo.com/xiaobo58/"
!define 					APPWEBSITE "http://weibo.com/xiaobo58/"
!define 					MUI_ICON "E:\DisplayIcon.ICO"
!define 					VERSION_MAJOR 2
!define		 				VERSION_MINOR 0201262
!define 					MUI_ABORTWARNING_TEXT "您是否要取消操作？？"
!define						MUI_TEXT_COMPONENTS_TITLE "选择清理项目"
!define						MUI_TEXT_COMPONENTS_SUBTITLE "请仔细选择您想要清理的项目，程序已经默认为您选择了几个常用的项目，您可以自行任意勾选。"
!define						MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "清理项目详细介绍"
!define						MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "请将您的鼠标移至您想要清理的项目之上，您将会看到所清理项目的详细提示信息。"
!define						MUI_TEXT_INSTALLING_TITLE "清理中，忙呢"
!define 					MUI_TEXT_INSTALLING_SUBTITLE "正在为您清理您的系统，请稍等片刻...^_^..."
!define						MUI_TEXT_FINISH_TITLE "您所选择的清理项已成功清理完毕"
!define						MUI_TEXT_FINISH_SUBTITLE "OK!!清理好啦，您又有了一个干净的系统了！"
!define						MUI_TEXT_ABORT_TITLE "您所选择的清理项目竟然没有成功清理？？"
!define						MUI_TEXT_ABORT_SUBTITLE "哎呀，没有清理成功嘞，请下仔细检查问题，如果还有疑问请 @上海三五牌闹钟（SinaMicroBlog）：http://weibo.com/xiaobo58/."
!include					"MUI.nsh"
!include					"x64.nsh"
!include					"Sections.nsh"
InstallDir					"c:\"
OutFile						"CleanV2RC_STD.exe"
Caption 					"Windows 系统清理工具 RC测试版"
Name 						"Windows 系统清理工具 RC测试版"
RequestExecutionLevel 		admin
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
  !define MUI_WELCOMEPAGE_TEXT "使用此软件可快速安全删除系统中的各类系统垃圾。\r\n\r\n此软件简单易用 。拥有多方位的清理方式，特别当今适合各行各业的电脑工作人员，可用于当今主流的各类桌面版 Windows 32 或 64 位操作系统。\r\n\r\n制作：周潇波 日期：2012年02月，祝大家新年快乐！\r\n\r\n注意：此版本为RC版，作者可允许您在大范围内公共使用，非常感谢您使用本软件！！"
  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_LANGUAGE "SimpChinese"
  VIProductVersion "2.0.2012.62"
  VIAddVersionKey /LANG=${1033-English} "ProductName" "Windows 系统清理工具 2012龙年特别版 正式标准版"
  VIAddVersionKey /LANG=${1033-English} "Comments" "制作：周潇波 2012年01月22日 星期日 农历2011年大年三十 18:00 (GMT+8) E－Mail:zhouxiaobo.500@163.com 祝大家楼年吉祥，幸福安康！"
  VIAddVersionKey /LANG=${1033-English} "CompanyName" "周潇波"
  VIAddVersionKey /LANG=${1033-English} "LegalTrademarks" "Windows 系统清理工具 正式标准版"
  VIAddVersionKey /LANG=${1033-English} "LegalCopyright" "Copyright (C) 2009-2012 by 周潇波"
  VIAddVersionKey /LANG=${1033-English} "FileDescription" "简单快速的系统清理工具，包含各类系统、软件清理、瘦身等功能。"
  VIAddVersionKey /LANG=${1033-English} "FileVersion" "2.0.2012.62"
  VIAddVersionKey /LANG=${1033-English} "Applies to" "Microsoft(R) Windows (R) 2000 Or Higher System."
  VIAddVersionKey /LANG=${1033-English} "Build Date " "2012/01/22 Sun 18:00 PM (GMT+8)"
  VIAddVersionKey /LANG=${1033-English} "Installation Type" "Custom Type"
  VIAddVersionKey /LANG=${1033-English} "Installer Engine" "ZHOUXIAOBO_SYSTEMCLEAN_ALPHAEDITION_Standard.exe"
  VIAddVersionKey /LANG=${1033-English} "Installer Version" "2.0.2012.62"
  VIAddVersionKey /LANG=${1033-English} "周潇波" "原创制作：周潇波，由周潇波发布的软件绿色无毒、环保耐用！感谢您的安装！My Sina MicroBlog(@上海三五牌闹钟)：http://weibo.com/xiaobo58/  Personal Electronic Mail:zhouxiaobo.500@163.com 、zhouxiaobo500@hotmail.com"
  VIAddVersionKey /LANG=${1033-English} "Package Type" "LZMA:26"
  VIAddVersionKey /LANG=${1033-English} "Proc. Architecture" "x86&x64"
  VIAddVersionKey /LANG=${1033-English} "Support Link" "@上海三五牌闹钟：http://weibo.com/xiaobo58/ "  
  VIAddVersionKey /LANG=${1033-English} "SetupDigitalSign" "SYSTEMCLEANHELPER(STDEDITION)[2012SPECIALEDITION]_V2.0.2012.62"
  
  Function .onInit
	Call GetWindowsVersion
	Pop $R0
	StrCmp $R0 "95" 0 +3
		MessageBox MB_OK "对不起，您使用的系统在现在相当冷门。由于您的系统的特殊性，我们无法对您的系统进行相关清理工作。请您谅解！$\n推荐您的使用更加新的电脑及系统以及时跟上时代的步伐。请您注意：现在并没有过多的软件支持您的系统，这将会使您的电脑操作变得困难并且缺乏更高的安全性。 您可以通过以下三种方式联系作者周潇波$\n1、使用新浪微博 @上海三五牌闹钟.http://weibo.com/xiaobo58/$\n2、您可以在百度知道中向zhouxiaobo500求助。$\n3、直接给周潇波发伊妹儿：zhouxiaobo.500@163.com 或 zhouxiaobo500@hotmail.com$\n$\n非常期待您及时的反馈，谢谢！！"
		Abort
	StrCmp $R0 "98" 0 +3
		MessageBox MB_OK "对不起，您使用的系统在现在相当冷门。由于您的系统的特殊性，我们无法对您的系统进行相关清理工作。请您谅解！$\n推荐您的使用更加新的电脑及系统以及时跟上时代的步伐。请您注意：现在并没有过多的软件支持您的系统，这将会使您的电脑操作变得困难并且缺乏更高的安全性。 您可以通过以下三种方式联系作者周潇波$\n1、使用新浪微博 @上海三五牌闹钟.http://weibo.com/xiaobo58/$\n2、您可以在百度知道中向zhouxiaobo500求助。$\n3、直接给周潇波发伊妹儿：zhouxiaobo.500@163.com 或 zhouxiaobo500@hotmail.com$\n$\n非常期待您及时的反馈，谢谢！！"
		Abort
	StrCmp $R0 "ME" 0 +3
		MessageBox MB_OK "对不起，您使用的系统在现在相当冷门。由于您的系统的特殊性，我们无法对您的系统进行相关清理工作。请您谅解！$\n推荐您的使用更加新的电脑及系统以及时跟上时代的步伐。请您注意：现在并没有过多的软件支持您的系统，这将会使您的电脑操作变得困难并且缺乏更高的安全性。 您可以通过以下三种方式联系作者周潇波$\n1、使用新浪微博 @上海三五牌闹钟.http://weibo.com/xiaobo58/$\n2、您可以在百度知道中向zhouxiaobo500求助。$\n3、直接给周潇波发伊妹儿：zhouxiaobo.500@163.com 或 zhouxiaobo500@hotmail.com$\n$\n非常期待您及时的反馈，谢谢！！"
		Abort
  InitPluginsDir   
  System::Call 'kernel32::CreateMutexA(i 0, i 0, t "nsis_chs_installer") i .r1 ?e'
  Pop $R0
  StrCmp $R0 0 +3
    MessageBox MB_OK|MB_ICONEXCLAMATION "另一个与本程序类似的软件正在运行中，请您稍后再拨！！"
    Abort
  FunctionEnd
  
/*Section ""  CLEAN

SectionEnd

Section ""  CLEAN

SectionEnd

Section ""  CLEAN

SectionEnd*/

SectionGroup "系统一般清理" NOR
Section "!基础删除" STANDARDCLEAN
  SectionIn RO
  SetDetailsPrint textonly
  DetailPrint "好好清理，天天向上！......"
  SetDetailsPrint listonly
  Delete $TEMP\*.*
  RMDir /r "$TEMP"
  Delete $WINDIR\TEMP\*.*
  Delete $APPDATA\Local\Temp\*.*																						/*以下项目在WIN7环境下加入，仅能供 Vista/7系统进行清理。*/
  RMDir /r "$APPDATA\Local\Temp"																						/*这里是属于“用户临时文件”*/
  RMDir /r "$WINDIR\TEMP"
  SetOutPath "$WINDIR\TEMP"
  Delete $WINDIR\system32\FNTCACHE.DAT																					/*Widnwos 字体缓存*/
SectionEnd
SectionGroupEnd

SectionGroup "系统高级清理" HIGHCLASS
Section "!运行对话框历史记录"  RUNCLEAN
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
SectionEnd
Section "!最近的打开的各类文件历史记录"  RECENTCLEAN
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
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"										/*以下几项在 WINXP 环境内加入*/
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\TrayNotify"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List"
  DeleteRegKey HKCU "Software\Microsoft\Windows\ShellNoRoam\MUICache"
  DeleteRegKey HKCU "Software\Microsoft\Internet Explorer\TypedURLs"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.flac"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.mmf"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.exe"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.rm"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.rmvb"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.dll"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.dll"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.flv"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.f4v"
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
    DeleteRegKey HKCU "Software\FlySky\E\Recent File List"																/*以下七项为新加入Masientwthtwe*/
    DeleteRegKey HKCU "Software\Macromedia\FlashPlayer"
    DeleteRegKey HKCU "Software\KCP Technologies, Inc.\几何画板\Recent File List"
    DeleteRegKey HKCU "Software\Adobe\MediaBrowser\MRU\Photoshop\FileList"
    DeleteRegKey HKCU "Software\FlySky\E\Recent File List"
    DeleteRegKey HKCU "Software\GoldWave\GoldWave\Recent Files"
	Delete	"C:\Users\周潇波\AppData\Local\CrashDumps"
SectionEnd
Section /o "Windows 画图及写字板历史记录"  PAINTCLEAN
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List"
SectionEnd
Section /o "Windows 预读、日志、内存转储、软件（系统）调试开始菜单等文件"  MEMCLEAN
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
  RMDir /r "$APPDATA\Local\CrashDumps"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu2\Programs\光影魔术手"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu2\Programs\AVG 2012"
  
SectionEnd
Section "Windows 缩略图缓存"  PICCLEAN
  Delete $APPDATA\Local\Microsoft\Windows\Explorer\*.*
  RMDir /r "$APPDATA\Local\Microsoft\Windows\Explorer"
SectionEnd


Section "Windows 错误报告"  ERRORLOGCLEAN   
  Delete $APPDATA\AppData\Local\Microsoft\Windows\WER\*.*
  RMDir /r "$APPDATA\AppData\Local\Microsoft\Windows\WER"
SectionEnd
Section "Windows 自动更新缓存"  AUPDATECLEAN
  Delete $WINDIR\SoftwareDistribution\Download\*.*
  RMDir /r "$WINDIR\SoftwareDistribution\Download"
SectionEnd
Section "其它类型清理(包括回收站)"  HIGHCLEAN
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

SectionGroup "浏览器清理" BR
Section /o "!IE浏览器"  IECLEAN
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
Section /o "!IE浏览器的 Cookies"  IECOOK
  Delete $COOKIES\*.*
  RMDir /r "$COOKIES"
SectionEnd
Section /o "Mozilla Firefox浏览器"  FOXCLEAN
  Delete $APPDATA\Mozilla\Firefox\Profiles\*.*
  RMDir /r "$APPDATA\Mozilla\Firefox\Profiles"
SectionEnd
SectionGroupEnd
SectionGroup "系统深度瘦身" THINPC
Section "!系统驱动备份"  DRIVERCLEAN
 Delete "$WINDIR\Driver Cache\*.*"
 RMDir /r "$WINDIR\Driver Cache"
SectionEnd
Section /o "仓颉输入法"  CANGJIECLEAN
 RMDir /r $WINDIR\IME\CINTLGNT
 RMDir /r $WINDIR\System32\IME\CINTLGNT
SectionEnd
Section /o "韩文输入法"  HANCLEAN
 RMDir /r $WINDIR\IME\imekr8
 RMDir /r $WINDIR\System32\IME\imekr8
SectionEnd
Section /o "!日文输入法"  JANCLEAN
 RMDir /r $WINDIR\IME\IMEJP10
 RMDir /r $WINDIR\System32\IME\IMEJP10
SectionEnd
Section /o "可删除的窗体外观及鼠标指针方案"  CHUANGTICLEAN
  DeleteRegKey HKCU "Control Panel\Appearance\Schemes"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Cursors\Schemes"
SectionEnd
Section /o "可删除的他国语言"  LANGUAGECLEAN
  DeleteRegKey HKLM "SYSTEM\CurrentControlSet\Control\Nls\Locale"
SectionEnd
Section /o "可删除的他国时区"  TIMEZONECLEAN
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
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Bahia Standard Time"							/*在WINXP环境下加入*/
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Kaliningrad Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mexico Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Mexico Standard Time 2"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\South Africa Standard Time"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones\Turkey Standard Time"
  
SectionEnd
Section /o "可删除的Internet国家和地区代码"  INTERNETCODECLEAN
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
SectionGroup "常用软件清理" SOFTCLEAN
Section "!Flash Player"  FLASHCLEAN
  Delete "$APPDATA\Macromedia\Flash Player\*.*"
  RMDir /r "$APPDATA\Macromedia\Flash Player"
  Delete "$APPDATA\Adobe\Flash Player\*.*"
  RMDir /r "$APPDATA\Adobe\Flash Player"
SectionEnd
Section "!使用常用软件时产生的历史记录及垃圾文件"  SOFTFILECLEAN
  DeleteRegKey HKCR "Applications\wps.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\wpp.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\ET.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\Photoshop.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\nEOKanKan.exe\shell\Open\command"
  DeleteRegKey HKCR "Applications\Fireworks.exe\shell\open\command"
  DeleteRegKey HKCR "Applications\dreamweaver.exe\shell\Open\command"
  DeleteRegKey HKCR "Applications\conew.exe\shell\open\command"
  DeleteRegKey HKCU "Software\FlySky\E\Recent File List"
  DeleteRegKey HKCU "Software\Macromedia\FlashPlayer"
  DeleteRegKey HKCU "Software\KCP Technologies, Inc.\几何画板\Recent File List"
  DeleteRegKey HKCU "Software\Adobe\MediaBrowser\MRU\Photoshop\FileList"
  DeleteRegKey HKCU "Software\GoldWave\GoldWave\Recent Files"
  RMDir /r "C:\StormMedia\StormCache\"
  RMDir /r "D:\StormMedia\StormCache\"
  RMDir /r "E:\StormMedia\StormCache\"
  RMDir /r "F:\StormMedia\StormCache\"
  RMDir /r "$APPDATA\Roaming\DriveTheLife2012"
  RMDir /r "$APPDATA\Roaming\Adobe\Common\Medi Cache Files/"
  RMDir /r "$APPDATA\Roaming\DriveTheLife2012\Dtl2012DownLoad"
  RMDir /r "$APPDATA\Roaming\LibreOffice\3\user\temp"
  RMDir /r "$WINDIR\Microsoft.NET\Framework64\v4.0.30319\SetupCache"
  RMDir /r "$APPDATA\Local\Opera\Opera\cache"
  RMDir /r "$PROGRAMFILES\KSafe\hotfix"
  RMDir /r "$APPDATA\AIRPLAY\CACHE"
  RMDir /r "$APPDATA\Kingsoft\kclear\temp"
  Delete "$APPDATA\Microsoft\Word\*.wbk"
SectionEnd
SectionGroupEnd

  LangString 	  	DESC_NOR							${LANG_SimpChinese}				"系统垃圾的一般清理工作，必须的！"
  LangString 	  	DESC_SOFTFILECLEAN					${LANG_SimpChinese}				"清理对于一些常用软件打开文件的历史记录、使用记录等等。定期清理可保护个人数据内容。"
  LangString 	  	DESC_SOFTCLEAN						${LANG_SimpChinese}				"系统安装的常用软件的清理工作，同样包括清理金山卫士下载补丁的临时文件（需要安装在默认目录）。定期清理可保护个人数据内容。"
  LangString 	  	DESC_DRIVERCLEAN					${LANG_SimpChinese}				"清理系统自带的驱动程序，删除后可能会造成某些驱动无法加载。"
  LangString 	  	DESC_FLASHCLEAN						${LANG_SimpChinese}				"清理浏览 Flash Player 的历史记录以及保存在系统内的 Flash 程序或游戏的进度、缓存等等。"
  LangString 	  	DESC_HIGHCLEAN						${LANG_SimpChinese}				"对于清理系统回收站(请三思而后行、且有些文件不能删除的请您手工删除)以及其它散落在各地的垃圾文件清理，皆可安全删除！"
  LangString 	 	DESC_STANDARDCLEAN				 	${LANG_SimpChinese} 			"清理有关系统的临时文件。"
  LangString 	 	DESC_THINPC							${LANG_SimpChinese}				"针对于 Windows 系统的深层瘦身。包括一些冷门、无用的系统功能。"
  LangString		DESC_BR								${LANG_SimpChinese}				"浏览器的完整痕迹清除。包括缓存、历史记录"
  LangString  		DESC_OFFICESOFTCLEAN				${LANG_SimpChinese}				"清理 Microsoft Office 系列软件的打开文件历史记录。对于办公室工作人员，建议定期清理。"
  LangString  		DESC_IECLEAN						${LANG_SimpChinese}				"清理 IE 浏览器的浏览记录。不包含 Cookies[一种文本文档，用于方便用户无需输入用户名及密码快速登录网站。因此容易产生安全问题。]"
  LangString  		DESC_IECook							${LANG_SimpChinese}				"清理 IE 浏览器的浏览 Cookies。"
  LangString  		DESC_PICCLEAN						${LANG_SimpChinese}				"Windows 缩略图缓存可以加快浏览图片时的速度。如果您不进行定期清理的话，它可以大量占用磁盘空间。定期清理可释放系统空间！"
  LangString  		DESC_ERRORLOGCLEAN					${LANG_SimpChinese}				"当某个程序出现了崩溃或非法操作时，系统会自动生成大量错误报告。定期清理可释放大量系统空间！"
  LangString 		DESC_FOXCLEAN						${LANG_SimpChinese}				"清理 Mozilla Firefox 浏览器的浏览记录。"
  LangString  		DESC_HIGHCLASS						${LANG_SimpChinese}				"系统内垃圾的更深一步清理，具有较好的信息保护功能。"
  LangString  		DESC_RUNCLEAN						${LANG_SimpChinese}				"清理运行对话框内的输入命令历史记录。"
  LangString   		DESC_RECENTCLEAN					${LANG_SimpChinese}				"清理系统中的文件、文件夹、历史记录；最近打开的各种常用程序、文件的历史记录"
  LangString   		DESC_PAINTCLEAN						${LANG_SimpChinese}				"清理系统自带的画图及写字板软件中的历史记录。"
  LangString  		DESC_MEMCLEAN						${LANG_SimpChinese}				"清理系统自动保存的预读、内存转储、系统日志、软件（系统）调试、开始菜单等文件及历史内容。定期清理可释放大量磁盘空间！"
  LangString		DESC_CANGJIECLEAN					${LANG_SimpChinese}		 		"清理系统内自带的微软仓颉输入法（推荐删除，版本太久）"
  LangString		DESC_HANCLEAN						${LANG_SimpChinese}				"清理系统内自带的微软韩文（朝鲜语）输入法。"
  LangString		DESC_JANCLEAN						${LANG_SimpChinese}				"清理系统内自带的微软日文输入法。"
  LangString		DESC_CHUANGTICLEAN					${LANG_SimpChinese}				"清理系统内可删除的窗体外观及鼠标指针方案（建议删除，内容无用）"
  LangString		DESC_LANGUAGECLEAN					${LANG_SimpChinese}				"清理系统内可删除的他国语言（已保留系统必须的内容，如果您不浏览国外网站，可安全删除）"
  LangString		DESC_TIMEZONECLEAN					${LANG_SimpChinese}				"清理系统内可删除的他国时区（已保留系统必须的内容，如果您不经常使用到国际时区，可安全删除）"
  LangString		DESC_INTERNETCODECLEAN				${LANG_SimpChinese}				"清理系统内可删除的 Internet 国家和地区代码（已保留系统必须的内容，如果您不经常浏览国外网站，可安全删除）"
  LangString		DESC_AUPDATECLEAN					${LANG_SimpChinese}				"Windows 在进行安装补丁更新时释放的缓存文件，定期清理可释放大量磁盘空间！"
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
  BrandingText																			"原创开发制作：周潇波 Copyright (C) 2009-2012 By 周潇波";EOF NOW
