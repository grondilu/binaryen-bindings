NativeCall bindings for the C binaryen API
==========================================

This module is a Perl 6 raw interface to the [C Binaryen API](https://github.com/WebAssembly/binaryen.git).


## Constants work-around

Dealing with functions passing and returning `struct` by value is difficult 
with NativeCall.  Possibly [even impossible](https://irclog.perlgeek.de/perl6/2016-11-13#i_13558596)

As a work around, a small C wrapper is provided.  They take a numeric value
as input and return a `BinaryenConst`, encapsulating the use of `BinaryenLiteral`.

This wrapper can be compiled as such:

    $ gcc -I$binaryen/src -c -Wall -Werror -fpic -lbinaryen binaryen-constants.c
    $ gcc -Wl,-R,/usr/local/lib -shared -o libbinaryen-constants.so binaryen-constants.o -lbinaryen

`$binaryen` is the path of your binaryen directory.
Then put libbinaryen-constants.so in /usr/local/lib, where the Perl 6 module will expect to find it.


