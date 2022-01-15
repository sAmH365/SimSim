%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    PRINT_STRING msg
    
    xor rax, rax
    ret

    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db(1) dw(2) dd(4) dq(8) d는 define의 약자
section .data
    msg db 'Hello Wrold', 0x00

    a db 17 ; [0x11]
    
    b dd 0x12345678 ; 거의 리틀엔디언 방식으로 데이터 저장 -> 값이 뒤집혀서 저장 됨
    ; - 빅 엔디언 : 숫자 비교에 유리
    ; -리틀 엔디언 : 캐스팅에 유리함 1바이트만 캐스팅하면 첫번째 값만 가져옴
  
    
    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [개수]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    e resb 10