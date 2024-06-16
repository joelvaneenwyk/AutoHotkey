# #
# # AutoHotkey
# #

set(TARGET_NAME auto_hotkey)

set(AHK_SOURCE_DIR ${CMAKE_SOURCE_DIR}/source)

set(AHK_COMMON_SOURCE_FILES
    ${AHK_SOURCE_DIR}/ahklib.cpp
    ${AHK_SOURCE_DIR}/ahklib.idl
    ${AHK_SOURCE_DIR}/ahkversion.cpp
    ${AHK_SOURCE_DIR}/application.cpp
    ${AHK_SOURCE_DIR}/AutoHotkey.cpp
    ${AHK_SOURCE_DIR}/clipboard.cpp
    ${AHK_SOURCE_DIR}/cpp.hint
    ${AHK_SOURCE_DIR}/Debugger.cpp
    ${AHK_SOURCE_DIR}/error.cpp
    ${AHK_SOURCE_DIR}/globaldata.cpp
    ${AHK_SOURCE_DIR}/hook.cpp
    ${AHK_SOURCE_DIR}/hotkey.cpp
    ${AHK_SOURCE_DIR}/input_object.cpp
    ${AHK_SOURCE_DIR}/keyboard_mouse.cpp
    ${AHK_SOURCE_DIR}/lib/CCallback.cpp
    ${AHK_SOURCE_DIR}/lib/DllCall.cpp
    ${AHK_SOURCE_DIR}/lib/drive.cpp
    ${AHK_SOURCE_DIR}/lib/env.cpp
    ${AHK_SOURCE_DIR}/lib/file.cpp
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
    ${AHK_SOURCE_DIR}/MdFunc.cpp
    ${AHK_SOURCE_DIR}/os_version.cpp
    ${AHK_SOURCE_DIR}/pch.cpp
    ${AHK_SOURCE_DIR}/script_autoit.cpp
    ${AHK_SOURCE_DIR}/script_com.cpp
    ${AHK_SOURCE_DIR}/script_expression.cpp
    ${AHK_SOURCE_DIR}/script_gui.cpp
    ${AHK_SOURCE_DIR}/script_menu.cpp
    ${AHK_SOURCE_DIR}/script_module.cpp
    ${AHK_SOURCE_DIR}/script_object_bif.cpp
    ${AHK_SOURCE_DIR}/script_object.cpp
    ${AHK_SOURCE_DIR}/script_registry.cpp
    ${AHK_SOURCE_DIR}/script.cpp
    ${AHK_SOURCE_DIR}/script2.cpp
    ${AHK_SOURCE_DIR}/SimpleHeap.cpp
    ${AHK_SOURCE_DIR}/StringConv.cpp
    ${AHK_SOURCE_DIR}/TextIO.cpp
    ${AHK_SOURCE_DIR}/util.cpp
    ${AHK_SOURCE_DIR}/var.cpp
    ${AHK_SOURCE_DIR}/window.cpp
    ${AHK_SOURCE_DIR}/WinGroup.cpp
)

set(AHK_HEADER_FILES
    ${AHK_SOURCE_DIR}/lib/functions.h
    ${AHK_SOURCE_DIR}/resources/resource.h
    ${AHK_SOURCE_DIR}/abi.h
    ${AHK_SOURCE_DIR}/ahkversion.h
    ${AHK_SOURCE_DIR}/application.h
    ${AHK_SOURCE_DIR}/clipboard.h
    ${AHK_SOURCE_DIR}/config.h
    ${AHK_SOURCE_DIR}/debug.h
    ${AHK_SOURCE_DIR}/Debugger.h
    ${AHK_SOURCE_DIR}/defines.h
    ${AHK_SOURCE_DIR}/DispObject.h
    ${AHK_SOURCE_DIR}/globaldata.h
    ${AHK_SOURCE_DIR}/hook.h
    ${AHK_SOURCE_DIR}/hotkey.h
    ${AHK_SOURCE_DIR}/input_object.h
    ${AHK_SOURCE_DIR}/keyboard_mouse.h
    ${AHK_SOURCE_DIR}/KuString.h
    ${AHK_SOURCE_DIR}/map.h
    ${AHK_SOURCE_DIR}/MdFunc.h
    ${AHK_SOURCE_DIR}/MdType.h
    ${AHK_SOURCE_DIR}/os_version.h
    ${AHK_SOURCE_DIR}/qmath.h
    ${AHK_SOURCE_DIR}/script.h
    ${AHK_SOURCE_DIR}/script_com.h
    ${AHK_SOURCE_DIR}/script_func_impl.h
    ${AHK_SOURCE_DIR}/script_object.h
    ${AHK_SOURCE_DIR}/SimpleHeap.h
    ${AHK_SOURCE_DIR}/stdafx.h
    ${AHK_SOURCE_DIR}/StringConv.h
    ${AHK_SOURCE_DIR}/StrRet.h
    ${AHK_SOURCE_DIR}/TextIO.h
    ${AHK_SOURCE_DIR}/util.h
    ${AHK_SOURCE_DIR}/var.h
    ${AHK_SOURCE_DIR}/window.h
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

set(AHK_SOURCE_FILES
    ${MIDL_FILE}
    ${MIDL_OUTPUT}/ahklib.tlb ${MIDL_OUTPUT}/ahklib_h.h ${MIDL_OUTPUT}/ahklib_i.c
    ${AHK_X64_SOURCE_FILES}
    ${AHK_COMMON_SOURCE_FILES}
)

set(SAVED_LINKER_FLAGS ${CMAKE_STATIC_LINKER_FLAGS})
set(CMAKE_STATIC_LINKER_FLAGS "")

if(WIN32)
    set(CMAKE_AR lib.exe)
    set(CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_RUNTIME_LIBRARY_MultiThreaded "")
    set(CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_RUNTIME_LIBRARY_MultiThreadedDLL "")
    set(CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_RUNTIME_LIBRARY_MultiThreadedDebug "")
    set(CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_RUNTIME_LIBRARY_MultiThreadedDebugDLL "")
    set(CMAKE_ASM_MASM_CREATE_STATIC_LIBRARY "<CMAKE_AR> /OUT:<TARGET> <LINK_FLAGS> <OBJECTS>")
endif()

set(CMAKE_STATIC_LINKER_FLAGS ${SAVED_LINKER_FLAGS})

enable_language(CXX)
add_executable(${TARGET_NAME} WIN32
    ${AHK_SOURCE_FILES}
)
set_source_files_properties(${AHK_X64_SOURCE_FILES} PROPERTY LANGUAGE ASM_MASM)
target_compile_features(${TARGET_NAME} PUBLIC cxx_std_17)
set_target_properties(${TARGET_NAME}
    PROPERTIES COMPILE_FLAGS "\
        -D_UNICODE \
        -DHAVE_CONFIG_H=1 \
        -DLINK_SIZE=4 \
        -DPC \
        -DSLJIT_CONFIG_AUTO=0 \
        -DSLJIT_CONFIG_DEBUG=0 \
		-DSLJIT_CONFIG_STATIC=1 \
        -DSLJIT_CONFIG_UNSUPPORTED=0 \
        -DSLJIT_CONFIG_X86_32=0 \
        -DSLJIT_CONFIG_X86_64=1 \
        -DSLJIT_CONFIG_X86=0 \
        -DSLJIT_DEBUG=0 \
        -DSLJIT_INLINE=inline \
        -DSLJIT_VERBOSE=0 \
        -DUNICODE \
")
target_include_directories(${TARGET_NAME} PUBLIC ${AHK_SOURCE_DIR})
target_include_directories(${TARGET_NAME} PRIVATE
    ${AHK_SOURCE_DIR}
    ${AHK_SOURCE_DIR}/lib
    ${AHK_SOURCE_DIR}/lib_pcre
    ${AHK_SOURCE_DIR}/lib_pcre/pcre
    ${AHK_SOURCE_DIR}/lib_pcre/pcre/sljit
    ${AHK_SOURCE_DIR}/libx64call
    ${AHK_SOURCE_DIR}/resources
    ${AHK_SOURCE_DIR}/scripts)
target_link_libraries(${TARGET_NAME}
    lib_pcre
    wsock32
    winmm
    version
    comctl32
    psapi
    wininet
    shlwapi
    uxtheme
    dwmapi
)
target_precompile_headers(${TARGET_NAME} PRIVATE "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_SOURCE_DIR}/source/stdafx.h>")

# ----------------------------------------
# packaging
# ----------------------------------------

# All install commands get the same destination. this allows us to use paths
# relative to the executable.
install(TARGETS ${TARGET_NAME} DESTINATION bin)

# Now comes everything we need, to create a package
# there are a lot more variables you can set, and some
# you need to set for some package types, but we want to
# be minimal here.
set(CPACK_PACKAGE_NAME "AutoHotkey")
set(CPACK_PACKAGE_VERSION "1.0.0")
