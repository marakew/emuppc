#	cl.exe /c /Zl /Gd /Tc my.c
# D:\T60\D\Develop\ida62\idasdk66\include

#my.exe: my.cpp
#	cl.exe /c my.cpp /I"D:\T60\D\Develop\VC2003TK\include" /I"D:\T60\D\Develop\VC2003TK\include\std" 
#	link.exe my.obj kernel32.lib libc.lib /NOLOGO /SAFESEH:NO /NODEFAULTLIB /LIBPATH:"D:\T60\D\Develop\VC2003TK\lib" /LIBPATH:"D:\T60\D\Develop\VC2003TK\win32\lib"


VC_DIR=D:\T60\D\Develop\VC2003TK\

VC_BIN="$(VC_DIR)\bin\"

VC_INCLUDE="$(VC_DIR)\include"
VC_INCLUDE_STD="$(VC_DIR)\include\std"
VC_LIB="$(VC_DIR)\lib"

VC_WIN32_INCLUDE="$(VC_DIR)\win32\include"
VC_WIN32_LIB="$(VC_DIR)\win32\lib"

IDASDK=D:\T60\D\Develop\ida62\idasdk68\

IDASDK_INCLUDE="$(IDASDK)\include"
IDASDK_LIB="$(IDASDK)\lib\x86_win_vc_32"

OBJS= emuppc.obj emul_ppc.obj

all: emuppc.plw
 
.cpp.obj:
	$(VC_BIN)\cl.exe /Fo$@ /c /EHsc /D__IDP__ /D__NT__ /I$(VC_INCLUDE) /I$(VC_INCLUDE_STD) /I$(IDASDK_INCLUDE) $<

emuppc.plw: $(OBJS)
	$(VC_BIN)\link.exe $(OBJS) kernel32.lib libc.lib ida.lib /OUT:$@ /DLL /NOLOGO /INCREMENTAL:NO /STUB:stub /LIBPATH:$(VC_LIB) /LIBPATH:$(VC_WIN32_LIB) /LIBPATH:$(IDASDK_LIB)
	@del emuppc.exp emuppc.lib

	
#strings.plw: 
#	cl.exe /c strings.cpp /EHsc /D__IDP__ /D__NT__ /I"D:\T60\D\Develop\VC2003TK\include" /I"D:\T60\D\Develop\VC2003TK\include\std" /I"D:\T60\D\Develop\ida62\idasdk66\include"
#	link.exe strings.obj kernel32.lib libc.lib ida.lib /OUT:$@ /DLL /NOLOGO /INCREMENTAL:NO /STUB:stub /LIBPATH:"D:\T60\D\Develop\VC2003TK\lib" /LIBPATH:"D:\T60\D\Develop\VC2003TK\win32\lib" /LIBPATH:"D:\T60\D\Develop\ida62\idasdk66\lib\x86_win_vc_32"
#	@del strings.exp strings.lib

#/NODEFAULTLIB
#/export:PLUGIN