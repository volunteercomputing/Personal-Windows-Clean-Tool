/****
This is a part of RamseyX source codes.
Copyright(R)2013 RamseyX Team

Build date : 2013/10/01
以下脚本中带有注释的皆为有问题的代码。
开始菜单将会自动创建，如要添加，请不要使用"MUI_STARTMENU"，的确太烦且需要额外插件，不大划算。
尽可能使用 !insertmacro MUI_PAGE_COMPONEMTS 方法。
开始菜单什么的我这里还没来得及加上去。
键入注册表好让添加、删除程序直接卸载的一段代码如果需要就补上吧，其实做成绿色软件也不错的。
关于英文版的问题，因为牵涉到一些提示性字段的问题，可以提供中英两个不同的版本。或者呢，找一下网上有没有多语言的解决方案。
NSIS相比较Inno，灵活性提高了不少。这是肯定的，我挺喜欢这个语言。
需要你们制作安装包的ISS脚本和图标文件，继续完善这里的内容。
其余的部分，可以邮件联系，谢谢！国庆快乐。

Update date: 2014/04/15
1）Banner 没加，可以另外定制。
2）做成绿色版还是写注册表，问一下 Tai Zizhen 吧。
3）末尾的Function .onInit个人感觉，有点废柴？！？
其他的，慢慢改吧。去年这个脚本该的太急了些。
****/
!include					"MUI.nsh"
!include					"x64.nsh"
!include					"Sections.nsh"
!define						PRODUCT_NAME "RamseyX 运算客户端"
!define 					PRODUCT_VERSION "4.4.1.0"
!define 					PRODUCT_PUBLISHER "RamseyX 小组"
!define						PRODUCT_WEB_SITE "http://www.ramseyx.org/index.html"
!define 					MUI_ICON "ICON.ico"
Name						"RamseyX 运算客户端"
InstallDir					"$APPDATA\RamseyX"
OutFile						"RamseyX_4.4.1_x86_setupNSIS.exe" 
RequestExecutionLevel 				admin
XPStyle						on
CRCCheck					on
WindowIcon					off
ShowInstDetails					show
ShowUninstDetails				show
SetCompressor /SOLID				lzma
SetCompressorDictSize				64
SetDatablockOptimize				on
BrandingText					"Copyright(R)2013 RamseyX 小组，保留所有权利"

  !define MUI_ABORTWARNING
  !define MUI_WELCOMEPAGE_TEXT "RamseyX 计划是一个为帮助解决图论中著名的拉姆齐问题而发起的公益分布式运算项目。\r\n\r\n我们因此能够搭建起一张运算能力惊人的巨大运算网，形成一台虚拟的“超级计算机”，这样巨大的运算力将对拉姆齐问题的探索与解决提供极大帮助。\r\n\r\n对于 RamseyX 计划，无论微小或是巨大，每个人的帮助都弥足珍贵。\r\n\r\n我们需要您的帮助！"
  !insertmacro MUI_PAGE_WELCOME

  !insertmacro MUI_PAGE_INSTFILES
  !define MUI_FINISHPAGE_RUN "$INSTDIR\RamseyX.exe"
  !insertmacro MUI_PAGE_FINISH
  !insertmacro MUI_UNPAGE_INSTFILES
  
  !insertmacro MUI_LANGUAGE "SimpChinese"
  VIProductVersion "4.4.1.0"
  VIAddVersionKey /LANG=${1033-English} "ProductName" "RamseyX 运算客户端 安装程序"
  VIAddVersionKey /LANG=${1033-English} "Comments" "Follow us at http://www.ramseyx.org/index.html"
  VIAddVersionKey /LANG=${1033-English} "CompanyName" "RamseyX 小组"
  VIAddVersionKey /LANG=${1033-English} "FileDescription" "RamseyX 运算客户端"
  VIAddVersionKey /LANG=${1033-English} "FileVersion" "4.4.1.0"
 
Section "install"
	SectionIn RO
	SetDetailsPrint textonly
	DetailPrint "正在安装主程式，请稍等片刻。。"

	SetOutPath "$INSTDIR"
	File file\*.*
	WriteUninstaller "$INSTDIR\UninstRamseyX.exe"
	
	/*WriteRegStr HKLM ${PRODUCT_UNIST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\UninstRamseyX.exe"
	WriteRegStr HKLM ${PRODUCT_UNIST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\RamseyX.exe"
	WriteRegStr HKLM ${PRODUCT_UNIST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
	WriteRegStr HKLM ${PRODUCT_UNIST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
	WriteRegStr HKLM ${PRODUCT_UNIST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"*/
SectionEnd

Section "Uninstall"
	MessageBox MB_OK|MB_ICONEXCLAMATION "卸载前请您确保RamseyX程序已关闭，谢谢！"
	Delete "$INSTDIR\*.*"
	RMDir "$INSTDIR"
	/*DeleteRegKey ${PRODUCT_UNINST_ROOT_KRY} "${PRODUCT_UNINST_KEY}"*/
SectionEnd

Function un.onInit
	MessageBox MB_YESNO "您真的要卸载本运算客户端吗？若有不足之处我们期待您的反馈！" IDYES NoAbort
	Abort
	NoAbort:
FunctionEnd

Function .onInit
	InitPluginsDir
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "nsis") i .rl ?e'
	pop $R0
	StrCmp $R0 0 +3
	MessageBox MB_OK|MB_ICONEXCLAMATION "有另一个安装程序正在运行。"
	Abort
FunctionEnd

