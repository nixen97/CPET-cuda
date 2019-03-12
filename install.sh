#!/bin/bash
cd ext/src
make
cd ../..
python setup.py install -f