package server;

public class VirtualCircle {

    private final int nodeId;
    private final String destination;
    private final int port;
    private final String name;

    public VirtualCircle(int nodeId, String destination, int port, String name) {
        this.nodeId = nodeId;
        this.destination = destination;
        this.port = port;
        this.name = name;
    }

    public int getNodeId() {
        return nodeId;
    }

    public String getDestination() {
        return destination;
    }

    public int getPort() {
        return port;
    }

    public String getName() {
        return name;
    }
}
