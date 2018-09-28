JARPATH = 'jeromq/target/jeromq-0.4.4-SNAPSHOT.jar';
javaclasspath(JARPATH)
if 1
    import org.zeromq.*
else
    % import org.zeromq.SocketType
    % import org.zeromq.ZMQ
    % import org.zeromq.ZContext
end

context = ZContext();
subscriber = context.createSocket(SocketType.SUB);
subscriber.connect('tcp://localhost:5556');
subscriber.subscribe('10001 ');

for requestNbr = 1 : 10
    message = char(subscriber.recvStr(0));
    fprintf('Received %s %d\n', message, requestNbr);
end