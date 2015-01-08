wget http://www.eng.lsu.edu/mirrors/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz \
-O apache-maven.tar.gz
mkdir -p /opt/maven
tar -xvzf apache-maven.tar.gz -C /opt/maven --strip-components=1
ln -s /opt/maven/bin/mvn /usr/bin/mvn
touch /etc/profile.d/maven.sh
cat > /etc/profile.d/maven.sh << EOL
#!/bin/bash
MAVEN_HOME=/opt/maven
PATH=$MAVEN_HOME/bin:$PATH
export PATH MAVEN_HOME
export CLASSPATH=.
EOL
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -version
echo $MAVEN_HOME
echo $PATH