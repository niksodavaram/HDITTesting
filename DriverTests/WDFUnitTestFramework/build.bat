@echo off
set WDK_PATH=C:\Program Files (x86)\Windows Kits\10
set WDKBIN_PATH=%WDK_PATH%\bin\10.0.22000.0
set WDKLIB_PATH=%WDK_PATH%\Lib\10.0.22000.0
set WDF_ROOT=%WDK_PATH%
set KMDF_INC_PATH=%WDF_ROOT%\Include\wdf\kmdf\1.15
set KMDF_LIB_PATH=%WDF_ROOT%\Lib\wdf\kmdf\amd64\1.15

if not exist build mkdir build

cl.exe /I"%KMDF_INC_PATH%" /I"%WDK_PATH%\Include\10.0.22000.0\km" ^
    /I"%WDK_PATH%\Include\10.0.22000.0\shared" ^
    /c /Zi /nologo /W3 /WX- /Od /Oi ^
    /D_AMD64_ /DDRIVER /D_WIN64 /DNDEBUG ^
    /D_KERNEL_MODE /D_UNICODE /DUNICODE ^
    /Gm- /EHsc /GS /fp:precise /Zc:wchar_t ^
    /Zc:forScope /Zc:inline /GR- /Fo"build\\" ^
    /Fd"build\vc142.pdb" /external:W3 ^
    /Gd /TP /FC /errorReport:prompt ^
    src\TestFramework.cpp

if %ERRORLEVEL% NEQ 0 (
    echo Build failed
    exit /b %ERRORLEVEL%
)

echo Build completed successfully