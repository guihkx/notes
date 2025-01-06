:: @call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
@call "C:\Users\user\Downloads\msvc\setup_x64.bat"
set CMAKE_BUILD_PARALLEL_LEVEL=%NUMBER_OF_PROCESSORS%
:: set VERBOSE=1
set Path=C:\Qt\Tools\CMake_64\bin;C:\Qt\Tools\Ninja;C:\Qt\5.15.2\msvc2019_64\bin;C:\Qt\5.15.2\msvc2019_64;%Path%
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build
cmake --install build --prefix build
windeployqt --qmldir src\qml build\bin
copy /B C:\Qt\Tools\OpenSSL\Win_x64\bin\libcrypto-1_1-x64.dll build\bin
copy /B C:\Qt\Tools\OpenSSL\Win_x64\bin\libssl-1_1-x64.dll build\bin
@cmd