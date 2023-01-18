
```

docker build . -t asterisk

docker run --rm -it --name asterisk \
-p 10000-10099:10000-10099/udp \
-p 5060:5060/udp \
-v $PWD/etc/simple1:/etc/asterisk \
asterisk


docker buildx build --platform linux/amd64 . -t asterisk

docker run --rm -it --name asterisk \
--platform linux/amd64 \
-p 10000-10099:10000-10099/udp \
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
* https://github.com/andrius/asterisk/tree/master

