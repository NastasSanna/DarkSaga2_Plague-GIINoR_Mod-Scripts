@echo off

::путь
set p_gothic="..\..\..\Gothic II DSP"
set p=%p_gothic%"\_work\data\Scripts"

DEL /F /Q %p_gothic%"\*.DMP"
DEL /S /Q "PrjGothic\*.tmp"

xcopy PrjGothic\_Intern		%p%"\Content\_Intern" 	/d /s /e /y
xcopy PrjGothic\AI		%p%"\Content\AI" 	/d /s /e /y
xcopy PrjGothic\Items		%p%"\Content\Items" 	/d /s /e /y
xcopy PrjGothic\Story		%p%"\Content\Story" 	/d /s /e /y

copy PrjGothic\gothic.src	%p%"\Content\DS2_Prolog.src" /y

xcopy PrjVisualFX\VisualFX		%p%"\System\VisualFX" 	/d /s /e /y
copy PrjVisualFX\VisualFX.src	%p%"\System\VisualFX_DSP.src" /y

xcopy PrjParticleFX\PFX		%p%"\System\PFX" 	/d /s /e /y
copy PrjParticleFX\ParticleFX.src	%p%"\System\ParticleFX_DSP.src" /y

xcopy PrjMenu\_Intern		%p%"\System\_Intern" 	/d /s /e /y
xcopy PrjMenu\Menu		%p%"\System\Menu" 	/d /s /e /y
copy PrjMenu\Menu.src	%p%"\System\Menu_DSP.src" /y

xcopy PrjSFX\SFX\SfxInst.d		%p%"\System\SFX\SfxInst_DSP.d" 	/d /s /e /y
copy PrjSFX\SFX.src	%p%"\System\SFX_DSP.src" /y


pause