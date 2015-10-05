FROM       cyberdojofoundation/gpp-4.9
MAINTAINER Michel Estermann <estermann.michel@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get update

RUN apt-get install -y ruby
RUN apt-get install -y ruby-dev

RUN apt-get install -y libboost-date-time-dev libboost-thread-dev libboost-system-dev libboost-regex-dev

RUN apt-get install -y cmake
RUN apt-get install -y libgtest-dev
RUN cd /usr/src/gtest && cmake -DCMAKE_BUILD_TYPE=Release .
RUN cd /usr/src/gtest && make
RUN cd /usr/src/gtest && mv lib* /usr/lib

RUN gem install --no-rdoc --no-ri bundler

WORKDIR /usr/src
RUN git clone https://github.com/cucumber/cucumber-cpp.git
WORKDIR /usr/src/cucumber-cpp
RUN git checkout -b cyberdojorelease v0.3
RUN mkdir /usr/src/cucumber-cpp/build
RUN cd /usr/src/cucumber-cpp/build && cmake -DCMAKE_BUILD_TYPE=Release -DCUKE_DISABLE_BOOST_TEST=ON -DCUKE_DISABLE_CPPSPEC=ON -DCUKE_ENABLE_EXAMPLES=OFF ..
RUN cd /usr/src/cucumber-cpp && cmake --build build --target cucumber-cpp --config Release
RUN cp -rvf /usr/src/cucumber-cpp/include/* /usr/include
RUN cd /usr/src/cucumber-cpp/build/src && mv lib* /usr/lib

