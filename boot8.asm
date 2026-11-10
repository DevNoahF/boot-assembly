[org 0x7c00]
mov bp, 0x9000
mov sp, bp

mov bx, MENSAGEM_MODO_REAL_16_BITS
call imprime

call mudar_para_modo_protegido

jmp $

%include "imprime.asm"
%include "gdt32.asm"
%include "imprime32.asm"
%include "modo32.asm"

[bits 32]
INICIO_MP:
    mov ebx, MENSAGEM_MODO_PROTEGIDO_32_BITS
    call imprime_mp
    jmp $

MENSAGEM_MODO_REAL_16_BITS db "Iniciando em 16 bits", 0
MENSAGEM_MODO_PROTEGIDO_32_BITS db "Iniciando em 32 bits", 0

times 510 - ($ - $$) db 0
dw 0xaa55
