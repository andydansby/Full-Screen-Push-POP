cls

del 1FSPP.tap

bas2tap -a1 -sloader loader.bas basloader.tap

pasmo -v --tap full_screen_push.asm FSPP.tap FSPP.sym

copy /b basloader.tap + FSPP.tap  1FSPP.tap

del FSPP.tap
del basloader.tap

@REM FSPP = full screen push pop
