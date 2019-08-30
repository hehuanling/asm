assume cs:code,ds:data,ss:stack
data segment
	db 'Welcome to Masm!'
	db 10000101b
	db 00010100b
	db 00000010b
	db 10000101b
	db 00010100b
	db 00000010b	
	db 00010100b
	db 00000010b	
	db 00010100b
	db 00000010b
	db 00000010b	
	db 00010100b
	db 00000010b	
	db 00010100b
	db 00000010b
	db 10000101b
	db 00010100b
	db 00000010b	
	db 00010100b
	db 00000010b	
	db 00010100b
	db 00000010b
	db 00000010b	
	db 00010100b
	db 00000010b	
	db 00010100b
	db 00000010b
data ends

stack segment	stack
	db 32 dup (0)
stack ends

code segment
	start:	mov ax,stack
			mov ss,ax
			mov sp,32				;设置栈顶

			mov ax,data
			mov ds,ax 				;初始化ds
			mov ax,0b800h
			mov es,ax				;es 显存地址
			mov bx,0

			
			
			mov di,36
			mov cx,25
		s0:	
			mov si,0
			push cx

			mov cx,16
		s:	mov dl,ds:[si+0]
			mov dh,ds:[bx+16]

			mov es:[di],dx
			inc si
			add di,2
			loop s

			inc bx
			add di,160-32
			pop cx
			loop s0

			mov ax,4c00h
			int 21h
code ends
end start
 



