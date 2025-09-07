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
- File names for the executable are currently limited by the standard file name lengths of FAT32 (5 characters for the name, 3 for the extension)
- The libshared library currently gets statically linked to your project
- GPU partial re-rendering can be buggy and not fully re-render the entire window. To bypass this limitation, redraw the entire window: `[draw_ctx].full_redraw = true;` 
