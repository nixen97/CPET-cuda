# CPET-cuda
C-based python extension template with CUDA support.

If CUDA support is not needed, consider using [CPET](https://github.com/nixen97/CPET) instead, as it is more flexible.

## Installation

```shell
$ ./install.sh
```

# Usage
There are four parts to the project.

### Extension
**location:** ext/py/

This is the actual extension.
This links the ext static library which contains CUDA code.
This is because setuptools/distutils don't like mixed compiler projects.

### Static Lib
**location:** ext/src/

Contains all the non-python wrapper code.
This part of the project is the only place that will succesfully compile CUDA.

### C-Test
**location:** ext/test/

This is for testing the C-code.
It will link directly to the static lib, and won't touch the python portion.

### Py-Test
**location:** tests/

For testing the build extension.
Run with runTest.(bat/sh). **NOTE**: This will install the extension on your system.

# Platforms
This currently only runs on Linux!
Windows support will come someday, but I want to use premake as a build system, and it currently doesn't support CUDA very well.
