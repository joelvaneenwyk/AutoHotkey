set(PROJECT_NAME auto_hotkey)

set(AHK_SOURCE_DIR ${CMAKE_SOURCE_DIR}/source)
set(PCRE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/source/lib_pcre)

include_directories(${AHK_SOURCE_DIR})
include_directories(${AHK_SOURCE_DIR}/lib)
include_directories(${AHK_SOURCE_DIR}/lib_pcre)
include_directories(${AHK_SOURCE_DIR}/lib_pcre/pcre)
include_directories(${AHK_SOURCE_DIR}/lib_pcre/pcre/sljit)
include_directories(${AHK_SOURCE_DIR}/libx64call)
include_directories(${AHK_SOURCE_DIR}/resources)
include_directories(${AHK_SOURCE_DIR}/scripts)

set(AHK_SOURCE_FILES
    ${AHK_SOURCE_DIR}/lib/CCallback.cpp
    ${AHK_SOURCE_DIR}/lib/DllCall.cpp
    ${AHK_SOURCE_DIR}/lib/drive.cpp
    ${AHK_SOURCE_DIR}/lib/env.cpp
    ${AHK_SOURCE_DIR}/lib/file.cpp
    ${AHK_SOURCE_DIR}/lib/functions.h
    ${AHK_SOURCE_DIR}/lib/Gui.ListView.cpp
    ${AHK_SOURCE_DIR}/lib/Gui.StatusBar.cpp
    ${AHK_SOURCE_DIR}/lib/Gui.TreeView.cpp
    ${AHK_SOURCE_DIR}/lib/input.cpp
    ${AHK_SOURCE_DIR}/lib/InputBox.cpp
    ${AHK_SOURCE_DIR}/lib/interop.cpp
    ${AHK_SOURCE_DIR}/lib/math.cpp
    ${AHK_SOURCE_DIR}/lib/pixel.cpp
    ${AHK_SOURCE_DIR}/lib/process.cpp
    ${AHK_SOURCE_DIR}/lib/regex.cpp
    ${AHK_SOURCE_DIR}/lib/sound.cpp
    ${AHK_SOURCE_DIR}/lib/string.cpp
    ${AHK_SOURCE_DIR}/lib/vars.cpp
    ${AHK_SOURCE_DIR}/lib/wait.cpp
    ${AHK_SOURCE_DIR}/lib/win.cpp
    ${AHK_SOURCE_DIR}/resources/resource.h
    ${AHK_SOURCE_DIR}/abi.h
    ${AHK_SOURCE_DIR}/ahklib.cpp
    ${AHK_SOURCE_DIR}/ahklib.idl
    ${AHK_SOURCE_DIR}/ahkversion.cpp
    ${AHK_SOURCE_DIR}/ahkversion.h
    ${AHK_SOURCE_DIR}/application.cpp
    ${AHK_SOURCE_DIR}/application.h
    ${AHK_SOURCE_DIR}/AutoHotkey.cpp
    ${AHK_SOURCE_DIR}/clipboard.cpp
    ${AHK_SOURCE_DIR}/clipboard.h
    ${AHK_SOURCE_DIR}/config.h
    ${AHK_SOURCE_DIR}/cpp.hint
    ${AHK_SOURCE_DIR}/debug.h
    ${AHK_SOURCE_DIR}/Debugger.cpp
    ${AHK_SOURCE_DIR}/Debugger.h
    ${AHK_SOURCE_DIR}/defines.h
    ${AHK_SOURCE_DIR}/DispObject.h
    ${AHK_SOURCE_DIR}/error.cpp
    ${AHK_SOURCE_DIR}/globaldata.cpp
    ${AHK_SOURCE_DIR}/globaldata.h
    ${AHK_SOURCE_DIR}/hook.cpp
    ${AHK_SOURCE_DIR}/hook.h
    ${AHK_SOURCE_DIR}/hotkey.cpp
    ${AHK_SOURCE_DIR}/hotkey.h
    ${AHK_SOURCE_DIR}/input_object.cpp
    ${AHK_SOURCE_DIR}/input_object.h
    ${AHK_SOURCE_DIR}/keyboard_mouse.cpp
    ${AHK_SOURCE_DIR}/keyboard_mouse.h
    ${AHK_SOURCE_DIR}/KuString.h
    ${AHK_SOURCE_DIR}/map.h
    ${AHK_SOURCE_DIR}/MdFunc.cpp
    ${AHK_SOURCE_DIR}/MdFunc.h
    ${AHK_SOURCE_DIR}/MdType.h
    ${AHK_SOURCE_DIR}/os_version.cpp
    ${AHK_SOURCE_DIR}/os_version.h
    ${AHK_SOURCE_DIR}/pch.cpp
    ${AHK_SOURCE_DIR}/qmath.h
    ${AHK_SOURCE_DIR}/script.cpp
    ${AHK_SOURCE_DIR}/script.h
    ${AHK_SOURCE_DIR}/script2.cpp
    ${AHK_SOURCE_DIR}/script_autoit.cpp
    ${AHK_SOURCE_DIR}/script_com.cpp
    ${AHK_SOURCE_DIR}/script_com.h
    ${AHK_SOURCE_DIR}/script_expression.cpp
    ${AHK_SOURCE_DIR}/script_func_impl.h
    ${AHK_SOURCE_DIR}/script_gui.cpp
    ${AHK_SOURCE_DIR}/script_menu.cpp
    ${AHK_SOURCE_DIR}/script_object.cpp
    ${AHK_SOURCE_DIR}/script_object.h
    ${AHK_SOURCE_DIR}/script_object_bif.cpp
    ${AHK_SOURCE_DIR}/script_registry.cpp
    ${AHK_SOURCE_DIR}/SimpleHeap.cpp
    ${AHK_SOURCE_DIR}/SimpleHeap.h
    ${AHK_SOURCE_DIR}/stdafx.h
    ${AHK_SOURCE_DIR}/StringConv.cpp
    ${AHK_SOURCE_DIR}/StringConv.h
    ${AHK_SOURCE_DIR}/StrRet.h
    ${AHK_SOURCE_DIR}/TextIO.cpp
    ${AHK_SOURCE_DIR}/TextIO.h
    ${AHK_SOURCE_DIR}/util.cpp
    ${AHK_SOURCE_DIR}/util.h
    ${AHK_SOURCE_DIR}/var.cpp
    ${AHK_SOURCE_DIR}/var.h
    ${AHK_SOURCE_DIR}/window.cpp
    ${AHK_SOURCE_DIR}/window.h
    ${AHK_SOURCE_DIR}/WinGroup.cpp
    ${AHK_SOURCE_DIR}/WinGroup.h
)
set(AHK_X86_SOURCE_FILES
    ${AHK_SOURCE_DIR}/x86call.asm
)
set(AHK_X64_SOURCE_FILES
    ${AHK_SOURCE_DIR}/libx64call/x64call.asm
    ${AHK_SOURCE_DIR}/libx64call/x64stub.asm
)
set(AHK_PROJECT_FILES
    ${AHK_SOURCE_DIR}/.gitattributes
    ${AHK_SOURCE_DIR}/.gitignore
    ${AHK_SOURCE_DIR}/cspell.json
    ${AHK_SOURCE_DIR}/debug.natvis
    ${AHK_SOURCE_DIR}/LICENSE
    ${AHK_SOURCE_DIR}/README-LIB.md
    ${AHK_SOURCE_DIR}/README.md
    ${AHK_SOURCE_DIR}/source/scripts/vsdev.cmd
    ${AHK_SOURCE_DIR}/libx64call/README.md
)
set(AHK_RESOURCE_FILES
    ${AHK_SOURCE_DIR}/scripts/minman.js
)

set(MIDL_OUTPUT ${AHK_SOURCE_DIR}/autogenerated)
set(MIDL_FILE ${AHK_SOURCE_DIR}/ahklib.idl)
add_custom_command(
    OUTPUT ${MIDL_OUTPUT}/ahklib.tlb ${MIDL_OUTPUT}/ahklib_h.h ${MIDL_OUTPUT}/ahklib_i.c
    COMMAND midl
    /W1 /nologo
    /char signed
    /target "NT60"
    /env x64
    /out "${MIDL_OUTPUT}"
    /h "${MIDL_OUTPUT}/ahklib_h.h"
    /tlb "${MIDL_OUTPUT}/ahklib.tlb"
    ${MIDL_FILE}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    DEPENDS ${MIDL_FILE}
    MAIN_DEPENDENCY ${MIDL_FILE}
    VERBATIM
)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE
    ${MIDL_FILE}
    ${MIDL_OUTPUT}/ahklib.tlb ${MIDL_OUTPUT}/ahklib_h.h ${MIDL_OUTPUT}/ahklib_i.c
    ${AHK_SOURCE_FILES})

set_target_properties(${PROJECT_NAME}
    PROPERTIES COMPILE_FLAGS "\
        -DHAVE_CONFIG_H=1 -DUNICODE -D_UNICODE \
        -DLINK_SIZE=4 -DSLJIT_INLINE=inline -DSLJIT_CONFIG_AUTO=1 \
        -DSLJIT_VERBOSE=0 -DSLJIT_DEBUG=0 -DSLJIT_CONFIG_X86_64=1 \
        -DSLJIT_CONFIG_AUTO=0 -DLINK_SIZE=4 -DSLJIT_VERBOSE=0 -DSLJIT_DEBUG=0 \
        -DSLJIT_CONFIG_X86=0 -DSLJIT_CONFIG_X86_32=0 -DSLJIT_CONFIG_X86_64=1 \
        -DSLJIT_CONFIG_UNSUPPORTED=0 \
        -DSLJIT_CONFIG_DEBUG=0 -DSLJIT_CONFIG_STATIC=1 \
        -DPC \
")
target_precompile_headers(${PROJECT_NAME} PUBLIC
    ${AHK_SOURCE_DIR}/stdafx.h
)