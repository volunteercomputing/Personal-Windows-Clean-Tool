/****
This is a part of RamseyX source codes.
Copyright(R)2013 RamseyX Team

Build date : 2013/10/01
���½ű��д���ע�͵Ľ�Ϊ������Ĵ��롣
��ʼ�˵������Զ���������Ҫ��ӣ��벻Ҫʹ��"MUI_STARTMENU"����ȷ̫������Ҫ�������������㡣
������ʹ�� !insertmacro MUI_PAGE_COMPONEMTS ������
��ʼ�˵�ʲô�������ﻹû���ü�����ȥ��
����ע��������ӡ�ɾ������ֱ��ж�ص�һ�δ��������Ҫ�Ͳ��ϰɣ���ʵ������ɫ���Ҳ����ġ�
����Ӣ�İ�����⣬��Ϊǣ�浽һЩ��ʾ���ֶε����⣬�����ṩ��Ӣ������ͬ�İ汾�������أ���һ��������û�ж����ԵĽ��������
NSIS��Ƚ�Inno�����������˲��١����ǿ϶��ģ���ͦϲ��������ԡ�
��Ҫ����������װ����ISS�ű���ͼ���ļ�������������������ݡ�
����Ĳ��֣������ʼ���ϵ��лл��������֡�

Update date: 2014/04/15
1��Banner û�ӣ��������ⶨ�ơ�
2��������ɫ�滹��дע�����һ�� Tai Zizhen �ɡ�
3��ĩβ��Function .onInit���˸о����е�ϲ񣿣���
�����ģ������İɡ�ȥ������ű��õ�̫����Щ��
****/
!include					"MUI.nsh"
!include					"x64.nsh"
!include					"Sections.nsh"
!define						PRODUCT_NAME "RamseyX ����ͻ���"
!define 					PRODUCT_VERSION "4.4.1.0"
!define 					PRODUCT_PUBLISHER "RamseyX С��"
!define						PRODUCT_WEB_SITE "http://www.ramseyx.org/index.html"
!define 					MUI_ICON "ICON.ico"
Name						"RamseyX ����ͻ���"
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
BrandingText					"Copyright(R)2013 RamseyX С�飬��������Ȩ��"

  !define MUI_ABORTWARNING
  !define MUI_WELCOMEPAGE_TEXT "RamseyX �ƻ���һ��Ϊ�������ͼ������������ķ�����������Ĺ���ֲ�ʽ������Ŀ��\r\n\r\n��������ܹ����һ�������������˵ľ޴����������γ�һ̨����ġ�������������������޴��������������ķ�������̽�������ṩ���������\r\n\r\n���� RamseyX �ƻ�������΢С���Ǿ޴�ÿ���˵İ������������\r\n\r\n������Ҫ���İ�����"
  !insertmacro MUI_PAGE_WELCOME

  !insertmacro MUI_PAGE_INSTFILES
  !define MUI_FINISHPAGE_RUN "$INSTDIR\RamseyX.exe"
  !insertmacro MUI_PAGE_FINISH
  !insertmacro MUI_UNPAGE_INSTFILES
  
  !insertmacro MUI_LANGUAGE "SimpChinese"
  VIProductVersion "4.4.1.0"
  VIAddVersionKey /LANG=${1033-English} "ProductName" "RamseyX ����ͻ��� ��װ����"
  VIAddVersionKey /LANG=${1033-English} "Comments" "Follow us at http://www.ramseyx.org/index.html"
  VIAddVersionKey /LANG=${1033-English} "CompanyName" "RamseyX С��"
  VIAddVersionKey /LANG=${1033-English} "FileDescription" "RamseyX ����ͻ���"
  VIAddVersionKey /LANG=${1033-English} "FileVersion" "4.4.1.0"
 
Section "install"
	SectionIn RO
	SetDetailsPrint textonly
	DetailPrint "���ڰ�װ����ʽ�����Ե�Ƭ�̡���"

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
	MessageBox MB_OK|MB_ICONEXCLAMATION "ж��ǰ����ȷ��RamseyX�����ѹرգ�лл��"
	Delete "$INSTDIR\*.*"
	RMDir "$INSTDIR"
	/*DeleteRegKey ${PRODUCT_UNINST_ROOT_KRY} "${PRODUCT_UNINST_KEY}"*/
SectionEnd

Function un.onInit
	MessageBox MB_YESNO "�����Ҫж�ر�����ͻ��������в���֮�������ڴ����ķ�����" IDYES NoAbort
	Abort
	NoAbort:
FunctionEnd

Function .onInit
	InitPluginsDir
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "nsis") i .rl ?e'
	pop $R0
	StrCmp $R0 0 +3
	MessageBox MB_OK|MB_ICONEXCLAMATION "����һ����װ�����������С�"
	Abort
FunctionEnd
