import nose

import ext

def setup_module():
    global vars

def test_test():
    assert ext.test() == "I am inside C"