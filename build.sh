rm -r driver-pack
cd driver && gradle clean model:jar jar && cd ..
mkdir driver-pack
cp driver/build/libs/driver.jar driver-pack/driver.jar
cd driver-pack
echo "java -jar driver.jar \$1 \$2 \$3" > run.sh
chmod +x run.sh