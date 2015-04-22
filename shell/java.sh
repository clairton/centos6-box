if [ ! -f jdk.tar.gz ]; then
  wget --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz" \
  -O jdk.tar.gz
fi
mkdir -p /opt/jdk
tar -xvzf jdk.tar.gz -C /opt/jdk --strip-components=1
touch /etc/profile.d/jdk.sh
cat > /etc/profile.d/jdk.sh << EOL
#!/bin/bash
JAVA_HOME=/opt/jdk
PATH=\$JAVA_HOME/bin:\$PATH && export PATH
export JAVA_HOME
CLASSPATH=\$JAVA_HOME/lib/tools.jar
CLASSPATH=.:\$CLASSPATH
export CLASSPATH
EOL
chmod +x /etc/profile.d/jdk.sh
source /etc/profile.d/jdk.sh
java -version
javac -version
