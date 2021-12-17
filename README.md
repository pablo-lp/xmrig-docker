Docker image builder for XMRIG without donations on latest Ubuntu

*Config*

Edit run.sh file

*Install*

docker build -t xmrig .

*Start container*

docker run -v /dev/hugepages:/dev/hugepages -it xmrig