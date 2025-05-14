#!/bin/bash
set -e

apt-get update
apt-get install -y git docker.io docker-compose python3-pip

# Enable Docker
systemctl enable docker
systemctl start docker

# Install Ansible (for CLI use if needed)
pip3 install ansible

# Clone AWX
git clone https://github.com/ansible/awx.git /opt/awx
cd /opt/awx/tools/docker-compose

# Create default inventory
cat <<EOF > .env
AWX_ADMIN_USER=admin
AWX_ADMIN_PASSWORD=ChangeMe123!
EOF

docker-compose up -d
