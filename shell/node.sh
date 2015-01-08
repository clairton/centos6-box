if [ ! -f node.tar.gz ]; then
  wget http://nodejs.org/dist/v0.10.35/node-v0.10.35-linux-x64.tar.gz \
  -O node.tar.gz
fi
mkdir -p /opt/node
tar -xvzf node.tar.gz -C /opt/node --strip-components=1
touch /etc/profile.d/node.sh
cat > /etc/profile.d/node.sh << EOL
#!/bin/bash
NODE_HOME=/opt/node
PATH=\$NODE_HOME/bin:$PATH
export PATH NODE_HOME
EOL
chmod +x /etc/profile.d/node.sh
source /etc/profile.d/node.sh
node -version
echo $NODE_HOME