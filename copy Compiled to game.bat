@echo off

::путь
set p_gothic="..\..\..\Gothic II DSP"
set p=%p_gothic%"\_work\data\Scripts"

DEL /F /Q %p_gothic%"\*.DMP"

copy PrjGothic\gothic.dat	%p%"\_compiled\DS2_Plague.dat" /y
copy PrjGothic\ou.bin		%p%"\Content\Cutscene\OU_DSP.bin" /y

pause