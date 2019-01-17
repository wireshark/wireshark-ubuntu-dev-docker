FROM ubuntu:18.04
RUN apt update
RUN apt install gnupg apt-utils -y
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main" > /etc/apt/sources.list.d/clang.list
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main" > /etc/apt/sources.list.d/clang6.list
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" > /etc/apt/sources.list.d/clang7.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 15CF4D18AF4F7421
RUN apt update
RUN apt upgrade -y
ADD https://raw.githubusercontent.com/wireshark/wireshark/master/tools/debian-setup.sh /
RUN chmod +x debian-setup.sh
RUN sed -i 's/debhelper//g' debian-setup.sh
RUN ./debian-setup.sh -y --install-optional --install-deb-deps --install-test-deps gcc-5 g++-5 gcc-6 g++-6 gcc-7 g++-7 gcc-8 g++-8 clang-5.0 clang-6.0 clang-7
