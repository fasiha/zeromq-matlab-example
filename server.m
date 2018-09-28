% Imitates behavior of running `./scripts/run-example hwserver` in JeroMQ repo.
% Prepare the following JAR file by running:
% `mvn clean install -DskipTests`
% in the JeroMQ repo.
JARPATH = 'jeromq/target/jeromq-0.4.4-SNAPSHOT.jar';
javaclasspath(JARPATH)
if 1
    import org.zeromq.*
    import java.lang.*
else
    % import org.zeromq.SocketType
    % import org.zeromq.ZMQ
    % import org.zeromq.ZContext
    % import java.lang.Thread
end

context = ZContext();
socket = context.createSocket(SocketType.REP);
socket.bind('tcp://:5555');

while (~Thread.currentThread().isInterrupted())
    reply = socket.recv(0);
    fprintf('Received: [%s]\n', char(reply(:)'));
    socket.send('world', 0);
    pause(1); % do some "work"
end
