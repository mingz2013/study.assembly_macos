- 先编写一个c语言的helloworld，
- 用Clang编译成汇编代码
    `clang -O2 -S -masm=intel -fno-asynchronous-unwind-tables hello.c`
这条命令的意思是让clang编译器编译hello.c，但是并不生成可执行程序或者机器码，而是生成汇编代码，语法格式为Intel语法。
-O2选项是启动优化，如果不启动优化的话，生成的汇编代码中会有一些无用的指令。
-fno-asynchronous-unwind-tables是阻止编译器生成“.cfi”系列的伪命令，主要用于记录栈帧信息，平时编写汇编时基本上不会用到。
执行完后会发现生成hello.s, 这个hello.s就是我们需要的汇编版本的helloworld源代码

hello_note_version.s 注释版

- 用as汇编器将源代码编译成.o文件
`as hello.s -o hello.o`

- 使用ld命令进行链接得到可执行文件
`ld hello.o -e _main -lsystem -arch x86_64 -macosx_version_min 10.12.0 -o hello`

-e (entry)指定了程序的入口点为 _main，如果不指定默认为 _start.
-lsystem 源代码中调用了系统的函数puts(), 所以需要-lsystem参数链接系统的库
-arch 表示链接为64位的应用程序
-macosx_version_min 指定了运行需要的最低系统版本


- 执行生成的hello可执行文件，会打印helloworld字符串





-------

as汇编器提供了一些伪指令方便节区的定义
按照简化伪指令的对应关系，可以将hello.s 简化，顺便去除编译器生成的不常用的伪指令，
hello_simple.s

