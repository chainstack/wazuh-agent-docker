#!/bin/bash

systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
