//
//  Link.m
//
//  Copyright (c) 2021 Changbeom Ahn
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Python.h>
#import <PythonSupport.h>

PyMODINIT_FUNC PyInit__multiarray_umath(void);
PyMODINIT_FUNC PyInit_lapack_lite(void);
PyMODINIT_FUNC PyInit__umath_linalg(void);
PyMODINIT_FUNC PyInit_fftpack_lite(void);
PyMODINIT_FUNC PyInit_mtrand(void);

ForceLink(NumPy,
          PyInit__multiarray_umath();
          PyInit_lapack_lite();
          PyInit__umath_linalg();
          PyInit_fftpack_lite();
          PyInit_mtrand())
