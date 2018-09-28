JARPATH = 'jeromq/target/jeromq-0.4.4-SNAPSHOT.jar';
javaclasspath(JARPATH)
if 1
    import org.zeromq.*
    import java.lang.*
else
    % import org.zeromq.SocketType
    % import org.zeromq.ZMQ
    % import org.zeromq.ZContext
end

context = ZContext();
publisher = context.createSocket(SocketType.PUB);
publisher.bind('tcp://:5556');
publisher.bind('ipc://weather');

nextInt = @(n) randi(n) - 1;

while (~Thread.currentThread().isInterrupted())
    zipcode = 10000 + nextInt(10000) - 1;
    temperature = nextInt(215) - 80 + 1;
    relhumidity = nextInt(50) + 10 + 1;
    publisher.send(sprintf('%05d %d %d', zipcode, temperature, relhumidity), 0);
end