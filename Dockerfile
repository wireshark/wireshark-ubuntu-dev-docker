FROM ubuntu:18.04
ADD https://raw.githubusercontent.com/wireshark/wireshark/master/tools/debian-setup.sh /
RUN apt-get update \
	&& apt-get install gnupg apt-utils ca-certificates -y --no-install-recommends \
	&& echo "deb https://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main" > /etc/apt/sources.list.d/clang10.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6084F3CF814B57C1CF12EFD515CF4D18AF4F7421 \
	&& apt-get update \
	&& apt-get upgrade -y \
	&& chmod +x debian-setup.sh \
	&& ./debian-setup.sh -y --install-optional --install-deb-deps --install-test-deps \
		--no-install-recommends build-essential fakeroot \
		python3-pytest-xdist locales \
		gcc-5 g++-5 \
		gcc-8 g++-8 \
		clang-10 \
	&& rm -rf /var/lib/apt/lists/
