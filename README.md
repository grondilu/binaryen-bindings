NativeCall bindings for the C binaryen API
==========================================

This module is a Perl 6 raw interface to the [C Binaryen API](https://github.com/WebAssembly/binaryen.git).

## Requirements

This modules requires the binaryen shared library file `libbinaryen.so` to be in /usr/local/lib

It also requires the small C wrapper file `utils.c` to be compiled and linked
into a share library in /usr/local/lib as well.  This file is used to wrap
functions that were difficult to adapt to NativeCall.

Compiling this file requires an access to binaryen source code,
here in a directory called `$binaryen`, and could be done with the 
following commands:

    $ gcc -I$binaryen/src -c -Wall -Werror -fpic utils.c
    $ gcc -Wl,-R,/usr/local/lib -shared -o utils.so utils.o -lbinaryen
    $ mv utils.so /usr/local/lib/libbinaryen-bindings-utils.so




