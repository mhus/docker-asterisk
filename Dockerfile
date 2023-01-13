FROM --platform=amd64 ubuntu:22.10

RUN set -x \
&& apt update \
&& ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
&& apt -y install git curl wget libnewt-dev libssl-dev libncurses5-dev subversion libsqlite3-dev build-essential libjansson-dev libxml2-dev uuid-dev psmisc \
&& cd /tmp/ \
&& curl -O http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20.1.0.tar.gz \
&& tar xzvf asterisk-20.1.0.tar.gz \
&& cd asterisk-20.1.0 \
&& contrib/scripts/get_mp3_source.sh 
RUN set -x \
&& cd /tmp/asterisk-20.1.0 \
&& contrib/scripts/install_prereq install \
&& ./configure
RUN set -x \
&& cd /tmp/asterisk-20.1.0 \
&& make
RUN set -x \
&& cd /tmp/asterisk-20.1.0 \
&& make install \
&& make samples \
&& make config \
&& ldconfig

RUN set -x \
&& cd /tmp/asterisk-20.1.0 \
&& groupadd asterisk \
&& useradd -r -d /var/lib/asterisk -g asterisk asterisk \
&& usermod -aG audio,dialout asterisk \
&& mkdir -p /var/run/asterisk || true \
&& chown asterisk:asterisk /var/run/asterisk \
&& chown -R asterisk:asterisk /var/lib/asterisk/ \
&& chown -R asterisk /var/spool/asterisk \
&& chown -R asterisk /var/log/asterisk

USER asterisk
CMD ["/usr/sbin/asterisk", "-T", "-fvvvv"]
