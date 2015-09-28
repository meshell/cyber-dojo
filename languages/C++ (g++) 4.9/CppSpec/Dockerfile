FROM       cyberdojofoundation/gpp-4.9_googlemock
MAINTAINER Michel Estermann <estermann.michel@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

WORKDIR /usr/src
RUN git clone https://github.com/meshell/cppspec.git
WORKDIR /usr/src/cppspec
RUN git checkout cmake_fix
RUN git submodule init
RUN git submodule update
RUN apt-get install -y cmake libboost-regex1.54.0 libboost-regex1.54-dev libboost-program-options1.54.0 libboost-program-options1.54-dev libboost-filesystem1.54.0 libboost-filesystem1.54-dev libboost-date-time1.54.0 libboost-date-time1.54-dev libboost-chrono1.54.0 libboost-chrono1.54-dev libboost-thread1.54.0 libboost-thread1.54-dev libboost-system1.54.0 libboost-system1.54-dev
RUN  cmake DCMAKE_CXX_FLAGS='-Wno-unused-local-typedefs' --target CppSpec .
RUN make
RUN mkdir /usr/include/CppSpec
RUN cp -rfT /usr/src/cppspec/include/ /usr/include/CppSpec
RUN cp -f /usr/src/cppspec/lib/libCppSpec.so /usr/lib
