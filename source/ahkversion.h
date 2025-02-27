#ifndef AHK_VERSION_H
#define AHK_VERSION_H

#include <winnt.h>

#define AHK_NAME "AutoHotkey"
#define T_AHK_NAME _T(AHK_NAME)

#if !defined(RAW_AHK_VERSION)
	// Fallback version string for when `git describe` fails during build.
	#define RAW_AHK_VERSION "2.0"
#endif	// RAW_AHK_VERSION

#if defined(RC_INVOKED)
	#define AHK_VERSION RAW_AHK_VERSION
	#ifndef AHK_VERSION_N
	#define AHK_VERSION_N 2,0,0,0
	#endif
#else
	// Use global variables rather than macros so only ahkversion.cpp needs to be recompiled
	// whenever GITDESC changes.
	extern LPSTR AHK_VERSION;
	extern LPTSTR T_AHK_VERSION;
	extern LPTSTR T_AHK_NAME_VERSION;
#endif	// RC_INVOKED

#endif	// AHK_VERSION_H
