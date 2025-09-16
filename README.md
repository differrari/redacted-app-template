Project template for a [REDACTED] OS project. 

Use this to have a starting point to make an app for [REDACTED] OS.

# Usage

1. Download the template, which contains a hello world project.
2. Configure the project in the Makefile:
   2.1. Configure OS_PATH to point to your installation of [REDACTED] OS. It will link to the system's libshared (REDACTED's substitute for libc), and automatically put the compiled file into the system's disk.
   2.2 Configue the executable's name in the EXEC_NAME variable
   2.3 (Optional) add any additional files you create into the makefile
3. Run `make run` to automatically compile your program and run [REDACTED] OS

Useful tips:
- The system's libshared, which gets automatically linked to your project, contains utility functions, as well as syscalls to interact with the system
- [REDACTED] OS has a `user` folder with a simple process used for testing and to show usage of syscalls and features of the system

Current limitations & Known issues:
- The libshared library currently gets statically linked to your project
- The elf file loader inside the system is quite dumb, it might not correctly handle all sections. For example: if the bss section is at the end of the file, the linker won't add the padding to the file and [REDACTED] won't allocate enough memory, possibly overwriting stack/heap or accessing unmapped memory. As a workaround, don't put bss at the end of the linker file
- Certain C language features (and possibly c++ and other languages), such as function pointers may not work well. This is due to the system not yet supporting virtual addresses or position-independent code. The best workaround is to avoid them. The second best is to patch the system to either always load the code at an address known ahead of time, or to create some basic virtual addressing support for it (PRs appreciated if it's not too hacky)
