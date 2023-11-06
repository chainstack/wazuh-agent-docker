FROM debian:buster-slim

LABEL version "4.4.4"
LABEL description "Wazuh Agent"

RUN apt-get update && apt-get install -y \
  procps curl apt-transport-https gnupg2 inotify-tools python-docker && \
  apt-get update && \
  curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.4.4-1_amd64.deb && sudo WAZUH_MANAGER='manager_server' WAZUH_REGISTRATION_PASSWORD='onboarding_pass' WAZUH_AGENT_GROUP='default' dpkg -i ./wazuh-agent.deb && \
  rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "service wazuh-agent start && sleep infinity"]