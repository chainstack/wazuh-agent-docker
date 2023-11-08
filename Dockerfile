FROM debian:buster-slim

LABEL version "4.4.4"
LABEL description "Wazuh Agent"

RUN apt-get update && apt-get install -y \
  procps curl apt-transport-https gnupg2 inotify-tools python-docker lsb-release vim && \
  apt-get update && \
  curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.4.4-1_amd64.deb && dpkg -i ./wazuh-agent.deb && \
  sed -i 's/MANAGER_IP/wazuh-workers.chainstack.net/g' /var/ossec/etc/ossec.conf && \
  rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "service wazuh-agent start && sleep infinity"]
