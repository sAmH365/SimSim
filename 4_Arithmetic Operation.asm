%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    GET_DEC 1, al
    GET_DEC 1, num ; input으로 값을 받아줌 앞에 1은 크기 (1바이트)
    
    ;PRINT_DEC 1, al
    ;NEWLINE
    ;PRINT_DEC 1, num
    
    ; 더하기 연산
    ; add a, b(a = a + b)
    ; a는 레지스터 or 메모리
    ; b는 레지스터 or 메모리 or 상소
    ; 단! a, b 모두 메모리는 X
    
    ; 빼기 연산
    ; sub a, b (a = a - b)
    ; 빼기규칙은 더하기 연산이랑 동일
    
    add al, 1 ; 레지스터 + 상수
    PRINT_DEC 1, al ; 1 + 1 = 2
    NEWLINE
    
    ;mov rax, num ; [num] 형식으로 안넣어주면 num은 주소값을 가진다
    
    ;add al, num ; al은 1byte크기 num에는 주소값이 들어가서 1byte초과
    add al, [num] ; 레지스터 + 메모리  2 + 2(입력받은값) = 4
    PRINT_DEC 1, al ; 1바이트 크기로 al(레지스터)를 출력 
    NEWLINE
    
    mov bl, 3 ; bl에 3이라는 값을 넣어줌  
    add al, bl ; 레지스터 + 레지스터, al +bl 4 + 3 = 7
    PRINT_DEC 1, al
    NEWLINE
    
    add [num], byte 1 ; 메모리 + 상수, 상수를 더할때는 크기를 정해줘야함, 2(입력받은값) + 1 = 3
    PRINT_DEC 1, [num] 
    NEWLINE
    
    add [num], al; 메모리 + 레지스터, 3(위에 계산된 값) + 7(al 계산된 값) = 10
    PRINT_DEC 1, [num]
    NEWLINE
    
    ; 곱하기 연산
    ; mul reg
    ; - mul bl => al * bl  (1바이트로 연산)
    ; -- 연산결과를 ax에 저장
    ; - mul bx => ax * bx (2바이트로 연산)
    ; -- 연산 결과는 dx(상위 16비트) ax(하위 16비트)에 저장
    
    ; ex) 5 *8 은?
    mov ax, 0
    mov al, 5
    mov bl, 8
    mul bl
    PRINT_DEC 2, ax
    NEWLINE
    
    ; 나누기 연산
    ; div reg
    ; - div bl => ax / bl
    ; -- 연산 결과는 al(몫) ah(나머지)
    
    ; 100 나누기 3은?
    mov ax, 100
    mov bl, 3
    div bl
    PRINT_DEC 1, al
    NEWLINE
    mov al, ah
    PRINT_DEC 1, al
    
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