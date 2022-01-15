%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    ; 쉬프트(shift) 연산, 논리(logical) 연산
    
    mov eax, 0x12345678
    PRINT_HEX 4, eax
    NEWLINE
    shl eax, 8 ; shl = shift left => 왼쪽으로 8칸 
    PRINT_HEX 4, eax
    NEWLINE
    shr eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    ; 곱셈/나눗셈에서 쉬프트 연산 활용 가능 lsh 1은 x2배의 효과
    ; 게임서버에서 ObjectID를 만들어줄때
    
    ; 논리연산 (not and or xor)
    
    ; not A : (0이면 1, 1이면 0)
    ; A and B : 둘다 1이면 1, 아니면 0
    ; A or B : 둘중 하나만 1이면 1, 아니면 0
    ; A xor B : 둘다 1이거나 둘다 0이면 0, 아니면 1
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    and al, bl ; al = al and bl
    PRINT_HEX 1, al
    NEWLINE
    
    not al
    PRINT_HEX 1, al
    NEWLINE
    ; 응용 사례 : bitflag

    mov al, 0b10010101
    mov bl, 0b01111100
    
    NEWLINE
    PRINT_HEX 1, al
    NEWLINE
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE
    ; xor 응용 -> 동일한 값으로 xor 두번하면 자기 자신으로 되돌아오는 특성
    ; 암호학에서 유용하다 (value xor key , al이 value bl이 key)
    
    ; 자기 자신을 xor 하면 0
    xor al, al ; al에 0
    PRINT_HEX 1, al
    
    xor rax, rax
    ret

    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db(1) dw(2) dd(4) dq(8) d는 define의 약자
;section .data

    
    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [개수]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    num resb 1