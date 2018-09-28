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
socket = context.createSocket(SocketType.REQ);
socket.connect('tcp://localhost:5555');
for requestNbr = 1 : 10
    socket.send(sprintf('Hello%d', requestNbr), 0);
    reply = socket.recv(0);
    fprintf('Received %s %d\n', char(reply(:)'), requestNbr)
end