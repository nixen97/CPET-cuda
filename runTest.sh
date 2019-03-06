#!/bin/bash
cd ext
make
cd ..
python setup.py install
nosetests tests/tests.py
