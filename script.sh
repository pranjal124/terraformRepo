#!/bin/bash
apt-get update -y
echo "Installing puppet"
apt-get install -y puppet
echo "cloning git repo"
git clone https://github.com/pranjal124/puppetwithAWS.git /tmp/puppet-manifests
echo "applying puppet configuration"
puppet apply /tmp/puppet-manifests/site.pp
