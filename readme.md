
```

docker build . -t asterisk

docker run --rm -it --name asterisk \
-p 5038:5038 \
-p 8088:8088 \
-p 4000-4100:4000-4100/udp \
-p 12001:12001/udp \
-p 15000-15100:15000-15100/udp \
-p 5060:5060/udp \
-v $PWD/etc/simple1:/etc/asterisk \
asterisk


docker buildx build --platform linux/amd64 . -t asterisk

docker run --rm -it --name asterisk \
--platform linux/amd64 \
-p 5038:5038 \
-p 8088:8088 \
-p 4000-4100:4000-4100/udp \
-p 12001:12001/udp \
-p 15000-15100:15000-15100/udp \
-p 5060:5060/udp \
-v $PWD/etc/simple1:/etc/asterisk \
asterisk

docker exec -it asterisk asterisk -vvvvvr

core reload
```

Sources:
* https://linuxhint.com/install-asterisk-ubuntu-22-04/
* https://computingforgeeks.com/how-to-install-asterisk-pbx-on-ubuntu/
* http://downloads.asterisk.org/pub/telephony/asterisk/
