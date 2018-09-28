all: client server jeromq/target/jeromq-0.4.4-SNAPSHOT.jar

client: client.c
	gcc client.c -o client -lzmq

server: server.c
	gcc server.c -o server -lzmq

clean:
	rm -f client server

jeromq/target/jeromq-0.4.4-SNAPSHOT.jar:
	rm -fr jeromq && git clone https://github.com/zeromq/jeromq.git && cd jeromq && mvn clean install -DskipTests
