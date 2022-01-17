FROM debian:9
SHELL ["/bin/bash", "-c"]

WORKDIR /opt/coin

RUN apt-get update && apt-get install -y wget python
RUN wget https://github.com/bitcoin-cash-node/bitcoin-cash-node/releases/download/v24.0.0/bitcoin-cash-node-24.0.0-x86_64-linux-gnu.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/* && rm -rf /opt/coin/bin/{bitcoin-qt,bitcoin-tx,bitcoin-seeder}

ENTRYPOINT ["/opt/coin/bin/bitcoind"]
CMD ["-conf=/opt/coin/coin.conf"]
