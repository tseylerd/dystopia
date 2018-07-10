rm -r pack
cd driver && gradle clean model:jar jar && cd ..
cd client && gradle clean jar && cd ..

mkdir pack
cp driver/build/libs/driver.jar pack/driver.jar
cp client/build/libs/client.jar pack/client.jar
cd pack
echo 'java -jar -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 "$(dirname "$0")"/driver.jar $1 $2 $3' >> run-driver.sh
chmod +x run-driver.sh
echo "echo 'running client'" > run-client.sh
echo "java -jar client.jar \$1 \$2 \$3" >> run-client.sh
chmod +x run-client.sh