org $8000
start:

	di
	call push_pop

return:
	ei

;endless:
;	jp endless


;If you want to return to basic, you should restore the IY and I registers



end_push_it:
ret


originalStack:
defw $0000


;;;;;;;;;;;;;;;;;;;;;;;;;;;
include "push_it.asm"

;just use one of the following files
;include "typed_data.asm"
include "girl.asm"

