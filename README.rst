
Example
=======

Quick and dirty example showing a way to
create a Haxe WebIDL `NativePtr` from C++
to use in a place where an already created
`NativePtr` is expected.

.. note:: Please, note that I didn't test this with Emscripten,
          I've never used that and seems not trivial to
          install in my system — looks like any build
          will fail with a Python error.

Setup
-----

```
lix download
```

Build for Haxe/C++ — Linux
--------------------------

```
make linux-shared
```

Run — Linux, shared library
---------------------------

```
make run-linux-shared
```

Should print

```
Sample.hx:21: Result = 11,13 len=17.0293863659264
Sample.hx:23: -1
Sample.hx:24: 1
Sample.hx:26: 11
Sample.hx:27: 13
```

Check memory with valgrind
--------------------------

```
make check-linux-shared
```
