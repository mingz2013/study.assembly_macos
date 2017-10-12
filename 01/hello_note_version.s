	.section	__TEXT,__text,regular,pure_instructions ## 接下来的代码所位于的段和节区，__TEXT说明是位于程序的代码段，__text则是主程序代码节区，后面的参数则是这个节区的属性，这里的段对应Mach-O文件格式中的段
	.macosx_version_min 10, 13  ## 运行程序所需macOS最低版本 10.13
	.intel_syntax noprefix  ## 汇编代码使用Intel语法
	.globl	_main  ## 希望_main符号可以被链接器ld使用，因为_main是程序的入口函数，所以它必须被链接器使用，并将入口地址写入可执行文件的LC_MAIN加载命令
	.p2align	4, 0x90   ## 指示了接下来的代码的对齐方式，这里是2^4=16字节对齐，指令空隙部分使用0x90(nop)进行填充
_main:                                  ## @main
## BB#0:   ## # 为单行注释， 多行注释用/ / 包裹

## 以下为真正的汇编指令，使用helloworld字符串作为参数调用了C的puts函数，然后返回0结束了main函数
	push	rbp
	mov	rbp, rsp
	lea	rdi, [rip + L_.str]
	call	_puts
	xor	eax, eax
	pop	rbp
	ret

	.section	__TEXT,__cstring,cstring_literals  ## 接下来的代码所位于的段和节区，__TEXT 说明是位于程序的代码段，__cstring 字符串节区
## 定义了一个字符串，在汇编代码中可以通过L_.str引用该字符串
L_.str:                                 ## @.str
	.asciz	"Hello, World\n"


.subsections_via_symbols ## 表示当前节区可以被链接到其他代码中，并且如果没有被其他代码引用则剔除掉
