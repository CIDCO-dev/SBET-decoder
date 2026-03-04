CXX ?= g++
CXXFLAGS ?= -Wall -Wextra -std=c++11
TEST_CPPFLAGS ?= -DCATCH_CONFIG_NO_POSIX_SIGNALS

.PHONY: default test clean doc deploy installation

default:
	mkdir -p build/bin
	$(CXX) $(CXXFLAGS) -o build/bin/sbet-decoder src/sbet-decoder.cpp src/SbetProcessor.cpp
	$(CXX) $(CXXFLAGS) -o build/bin/accuracy-decoder src/accuracy-decoder.cpp

test: clean default
	mkdir -p build/test/reports
	$(CXX) $(CXXFLAGS) $(TEST_CPPFLAGS) -o build/test/tests test/CatchMain.cpp
	build/test/tests -r junit -o build/test/reports/sbet-test-linux-report.xml

clean:
	rm -rf build

doc:
	rm -rf build/doxygen
	mkdir -p build/doxygen
	doxygen

deploy:
	
installation:
	../Qt/QtIFW-3.1.1/bin/binarycreator -t ../Qt/QtIFW-3.1.1/bin/installerbase -p SBET-decoder_Directory -c SBET-decoder_Directory/config/config.xml SBET-decoder
