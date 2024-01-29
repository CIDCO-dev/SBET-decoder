CC=g++
OPTIONS=-Wall -static
INCLUDES=-I/usr/include/eigen3 -I/usr/include/boost
CFLAGS=-Wall

default:
	mkdir -p build/bin
	$(CC) $(CFLAGS) -o build/bin/sbet-decoder src/sbet-decoder.cpp src/SbetProcessor.cpp
	$(CC) $(CFLAGS) -o build/bin/accuracy-decoder src/accuracy-decoder.cpp
test: clean default
	mkdir -p build/test/reports
	$(CC) $(CFLAGS) -o build/test/tests test/CatchMain.cpp
	build/test/tests -r junit -o build/test/reports/sbet-test-linux-report.xml
	
test-quick: default
	mkdir -p build/test
	mkdir -p build/test/reports
	$(CC) $(OPTIONS) $(INCLUDES) test/CatchMain.cpp -o build/test/tests
	build/test/tests	

clean:
	rm -rf build

doc:
	rm -rf build/doxygen
	mkdir -p build/doxygen
	doxygen

deploy:
	
installation:
	../Qt/QtIFW-3.1.1/bin/binarycreator -t ../Qt/QtIFW-3.1.1/bin/installerbase -p SBET-decoder_Directory -c SBET-decoder_Directory/config/config.xml SBET-decoder
