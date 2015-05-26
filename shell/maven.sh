if [ ! -f apache-maven.tar.gz ]; then
  wget http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz \
  -O apache-maven.tar.gz
fi
mkdir -p /opt/maven
tar -xvzf apache-maven.tar.gz -C /opt/maven --strip-components=1
ln -s /opt/maven/bin/mvn /usr/bin/mvn
touch /etc/profile.d/maven.sh
cat > /etc/profile.d/maven.sh << EOL
#!/bin/bash
M2_HOME=/opt/maven
PATH=\$M2_HOME/bin:\$PATH
export PATH M2_HOME
export CLASSPATH=.
EOL
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -version
