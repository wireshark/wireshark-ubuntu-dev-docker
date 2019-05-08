FROM ubuntu:18.04
ADD https://raw.githubusercontent.com/wireshark/wireshark/master/tools/debian-setup.sh /
RUN apt update \
	&& apt install gnupg apt-utils -y \
	&& echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" > /etc/apt/sources.list.d/clang7.list \
	&& echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main" > /etc/apt/sources.list.d/clang8.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6084F3CF814B57C1CF12EFD515CF4D18AF4F7421 \
	&& apt update \
	&& apt upgrade -y \
	&& chmod +x debian-setup.sh \
	&& ./debian-setup.sh -y --install-optional --install-deb-deps --install-test-deps \
		python3-pytest-xdist locales \
		gcc-5 g++-5 \
		gcc-6 g++-6 \
		gcc-7 g++-7 \
		gcc-8 g++-8 \
		clang-5.0 \
		clang-6.0 \
		clang-7 \
		clang-8 \
	&& rm -rf /var/lib/apt/lists/
