# CPET
C-based python extension template

# Usage
There are three parts to the project.

### Extension
**location:** ext/src/

This is the actual extension.
The ext.c file contains the python specific code, and is wrapped by a #ifdef, that allows C-Test to strip it.
The EXT_API macro defined in common.h, is also stripped when compiling with setuptools/distutils, to hand over export-control to python.

### C-Test
**location:** ext/test/

This is for testing the C-code.
Is build with premake5, using the generation script genProject.(bat/sh).

### Py-Test
**location:** tests/

For testing the build extension.
Run with runTest.(bat/sh). **NOTE**: This will install the extension on your system.


# Platforms
This will run on Windows and Linux.
If you want to use it on OSX, I will merge PRs.
