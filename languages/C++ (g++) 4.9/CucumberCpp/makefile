
CXXFLAGS += -I. -std=c++11 -Wall -Wextra -Werror
BOOST_LIBS = -lboost_regex -lboost_date_time -lboost_thread -lboost_system
GTEST_LIBS = -lgtest -pthread
CUCUMBER_CPP_LIB = -lcucumber-cpp

HPP_FILES = $(wildcard *.hpp)
COMPILED_HPP_FILES = $(patsubst %.hpp,%.compiled_hpp,$(HPP_FILES))
CPP_FILES = $(wildcard *.cpp)

.PHONY: test.output
test.output: test makefile
        ./$< &

test: makefile $(CPP_FILES) $(COMPILED_HPP_FILES)
        @$(CXX) $(CXXFLAGS) -O $(CPP_FILES) $(CUCUMBER_CPP_LIB) $(BOOST_LIBS) $(GTEST_LIBS) -o $@

# This rule ensures header files build in their own right.
# The quality of header files is important because header files
# are #included from other files and thus have a large span
# of influence (unlike .cpp files which are not #included)

%.compiled_hpp: %.hpp
        @$(CXX) -x c++ $(CXXFLAGS) -c -o $@ $<
