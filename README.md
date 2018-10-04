# ØMQ in MATLAB with JeroMQ

## Prep JeroMQ
Obtain and build JeroMQ:
```
brew install maven
git clone https://github.com/zeromq/jeromq.git
cd jeromq
mvn clean install -DskipTests
```

Still in the JeroMQ directory, test that it works in one tab start the [weather](http://zguide.zeromq.org/page:all#Getting-the-Message-Out) server:
```
./scripts/run-example wuserver
```
while in another tab, run the client:
```
./scripts/run-example wuclient
```
Maven will print out a bunch of Java-related messages, then something like
```
Collecting updates from weather server
Average temperature for zipcode '10001 ' was 32.
```
The last line might take a while, since it's waiting for 100 updates. Maven will exit with
```
[INFO] BUILD SUCCESS
```

## MATLAB
In one Matlab session, start the server:
```
>> wuserver
```
and in the other, start the client:
```
>> wuclient
```
You can mix and match the Java vs MATLAB clients and servers to confirm that they are talking the same protocol.

## C Hello World server and client
This repository also includes the C implementation of the basic [Hello World](http://zguide.zeromq.org/page:all#Ask-and-Ye-Shall-Receive) REQ-REP (request–reply) ØMQ. To try this:
```
brew install zeromq
make
./server`
in one Terminal tab to build and start the server, and in another tab:
```
./client
```