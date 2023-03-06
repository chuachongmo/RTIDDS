set PATH="C:\Program Files\rti_connext_dds-5.3.1\bin"
set "current_dir=%cd%"

IF NOT EXIST HelloWorld (
echo Creating HelloWorld Directory
md HelloWorld
) ELSE (
echo HelloWorld Already exist
)

rtiddsgen "%current_dir%\HelloWorld.idl" -ppDisable -d "%current_dir%\HelloWorld" -language C++11 -create typefiles -create examplefiles -create makefiles -platform i86Win32VS2013 -stl -sharedLib 
