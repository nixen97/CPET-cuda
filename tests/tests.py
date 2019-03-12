import nose

import ext

def setup_module():
    global vars

def test_test():
    a = ext.test()
    print(a)
    assert a == True