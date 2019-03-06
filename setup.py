try:
      from setuptools import setup, Extension
except ImportError:
      from distutils.core import setup, Extension

from glob import glob

ext = Extension('ext',
                language="c",
                sources = glob('./ext/py/**.c', recursive=True),
                include_dirs=["./ext/src"],
                library_dirs=["/usr/local/cuda/lib64"],
                libraries=["cudart"],
                extra_objects=["./build/test/bin/libLib."])

setup(name = "ext",
      version = "1.0",
      description = "This is a description",
      ext_modules=[ext])