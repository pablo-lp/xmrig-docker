FROM ubuntu:latest
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev \
    git && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/pablo-lp/xmrig.git \
    && mkdir xmrig/build && cd xmrig/build \
    && cmake -DWITH_OPENCL=OFF -DWITH_CUDA=OFF .. \
    && make -j$(nproc)  

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
ENTRYPOINT ["/usr/local/bin/run.sh"]
