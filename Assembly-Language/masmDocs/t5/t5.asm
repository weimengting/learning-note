assume cs:code,ds:data,ss:stack,es:table

data segment
	db 'welcome to masm!',2,24h,71h
data ends

stack segment
	dw 0,0,0,0
stack ends

table segment
	dw 4000 dup(0)
table ends

code segment
	start: mov ax,data
		   mov ds,ax
		   mov bx,0
		   mov ax,table
		   mov es,ax
		   mov ax,stack
		   mov ss,ax
		   mov sp,8
		   mov cx,3
		   mov si,0
		   mov bp,0

		s: push cx
		   mov cx,16

	   s0: mov al,[bx]
	       mov es:[si+bp],al
	       inc bx
	       add bp,2
	       loop s0

	       add si,0a0h
	       pop cx
	       mov bx,0
	       mov bp,0
	       loop s

	       mov ax,4c00h
	       int 21h
code ends
end start
