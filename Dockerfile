FROM debian:9
SHELL ["/bin/bash", "-c"]

WORKDIR /opt/coin

RUN apt-get update && apt-get install -y wget python
RUN wget https://www.bitcoinunlimited.info/downloads/bch-unlimited-1.9.0.1-linux64.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/* && rm -rf /opt/coin/bin/{bitcoin-miner,bitcoin-qt,bitcoin-tx,electrscash,test_bitcoin}

ENTRYPOINT ["/opt/coin/bin/bitcoind"]
CMD ["-conf=/opt/coin/coin.conf"]
