#include <Python.h>
#include "main.h"

// A test function
static PyObject* ext_test(PyObject *self, PyObject *args)
{
    return PyUnicode_FromString(testFunc());
}

// Method-table
static PyMethodDef ExtMethods[] = {
    {"test", ext_test, METH_VARARGS, "Print a test string"},
    {NULL, NULL, 0, NULL} // Docs call this 'sentinel', TODO: figure out what that means
};

// Module definition
static struct PyModuleDef extmodule = {
    PyModuleDef_HEAD_INIT,
    "ext",      // Name
    NULL,       // Documentation module
    -1,         // Size of per intepreter state of module, -1 if state in global vars
    ExtMethods  // Method table
};

// Init function
PyMODINIT_FUNC
PyInit_ext(void)
{
    return PyModule_Create(&extmodule);
}