%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging

    ; 8bit = 1byte
    ; 16bit = 2byte = 1word
    ; 32bit = 4byte = 2word = 1dword (double-word)
    ; 64bit = 8byte = 4word = 1qword (quad-word)
    
    ; mov reg1, cst : 오른쪽에서 왼쪽으로 데이터 이동
    ;mov reg1, reg2
    ; eax : 하위 32bit 만 사용
    
    mov eax, 0x1234
    mov rbx, 0x12345678
    mov cl, 0xff
    
    mov al, 0x00 ;하위비트에만(8bit) 0값을 넣어서 1200이 출력
    
    ; 메모리 <-> 데이터
    ;mov rax, a ; a의 값이 아닌 주소값을 가져옴
    mov rax, [a] ; a라는 변수 안에 있는 값을 rax에다 복사
                 ; 크기를 지정해 주지 않아서 다 가져온다
                 
    mov [a], byte 0x55
    mov [a], word 0x6666
    mov [a], cl
    
    ;mov al, [a]  ; 하위 1byte만 사용하도록 크기 정해줌
    
    xor rax, rax
    ret
    
    ; 변수의 선언 및 사용
    ; 처음에 이름과 크기 지정
    
    ; 메모리에는 구분할 수 있도록 주소(번지수)가 있다

    
    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db(1) dw(2) dd(4) dq(8) d는 define의 약자
section .data
    a db 0x11
    b dw 0x2222
    c dd 0x333333
    d dq 0x444444444444
    
    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [개수]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    e resb 10