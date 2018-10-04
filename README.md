# ØMQ in MATLAB with JeroMQ

## Prep JeroMQ
Obtain and build JeroMQ:
```
brew install maven
git clone https://github.com/zeromq/jeromq.git
cd jeromq
mvn clean install -DskipTests
```

## JeroMQ weather server and client
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

## MATLAB weather server and client
In one Matlab session, start the server:
```
>> wuserver
```
and in the other, start the client:
```
>> wuclient
```
You can mix and match the Java vs MATLAB clients and servers to confirm that they are talking the same protocol. (The MATLAB client won't parse the weather update and compute the average temperature like the Java one does: it will just print each message it receives.)

### MATLAB import caveat
It's not clear to me why Matlab 2018a refuses to run a script with the following:
```matlab
import org.zeromq.SocketType
import org.zeromq.ZMQ
import org.zeromq.ZContext
```
I can run these on the MATLAB command-line but not in a script. To overcome this issue, I just import the entire namespace via `import org.zeromq.*`. I will update this document if this issue is resolved.

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