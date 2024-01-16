FROM debian:buster-slim

LABEL version "4.7.2"
LABEL description "Wazuh Agent"

COPY ossec.conf /

RUN apt-get update && apt-get install -y \
  procps curl apt-transport-https gnupg2 inotify-tools python-docker lsb-release vim && \
  apt-get update && \
  curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.7.2-1_amd64.deb && dpkg -i ./wazuh-agent.deb && \
  mv /ossec.conf /var/ossec/etc/ && \
  rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "service wazuh-agent start && sleep infinity"]