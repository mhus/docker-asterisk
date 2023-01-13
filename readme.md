

docker buildx build --platform linux/amd64 . -t asterisk

docker run --rm -it --name asterisk --platform linux/amd64 -p 5038:5038 -p 8088:8088 -p 12001:12001/udp -p 15000-15100:15000-15100/udp -p 5060:5060/udp asterisk
