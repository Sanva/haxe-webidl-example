all: hl js

libpoint.cpp:
	haxe -lib webidl --macro "SampleModule.buildLibCpp()"

libpoint.js: libpoint.cpp
	haxe -lib webidl --macro "SampleModule.buildLibJS()"

js: libpoint.js
	haxe -js sample.js -lib webidl -main Sample -dce full

# ---- HL PART

ifndef HLPATH
HLPATH = /path/to/hl
endif

libpoint.hdll: libpoint.cpp
	$(CC) -o libpoint.hdll -shared -fPIC -Wall -O3 -I . -I $(HLPATH) libpoint.cpp point.cpp -lstdc++ -lhl

libpoint_win: libpoint.cpp
	cl /olibpoint.hdll /LD /EHsc /I $(HLPATH) /DYNAMICBASE libhl.lib libpoint.cpp point.cpp

hl:	libpoint.hdll
	haxe sample.hxml

linux-shared: libpoint.cpp
	haxe -hl out/main.c -lib webidl -main Sample
	$(CC) -o libpoint.so -shared -fPIC -Wall -O3 -I . -I $(HLPATH) libpoint.cpp point.cpp -lstdc++ -lhl
	$(CC) -O3 -o sample -std=c11 -I out out/main.c -lhl -L"`pwd`" -lpoint

run-linux-shared:
	LD_LIBRARY_PATH=`pwd`:${LD_LIBRARY_PATH} ./sample

check-linux-shared:
	LD_LIBRARY_PATH=`pwd`:${LD_LIBRARY_PATH} valgrind ./sample

.PHONY: libpoint.cpp libpoint.js

.SUFFIXES : .cpp .o

.cpp.o:
	$CC
