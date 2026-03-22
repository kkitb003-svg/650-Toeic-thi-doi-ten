package server;

import java.net.URI;

public class RoutingTable {

    private final VirtualCircle[] table;

    public RoutingTable(String peers, int defaultPort) {
        String[] peerList = peers.split(",");
        table = new VirtualCircle[peerList.length];

        for (int i = 0; i < peerList.length; i++) {
            table[i] = parsePeer(peerList[i].trim(), i + 1, defaultPort);
        }
    }

    private VirtualCircle parsePeer(String rawPeer, int nodeNumber, int defaultPort) {
        if (rawPeer == null || rawPeer.isEmpty()) {
            throw new IllegalArgumentException("Peer entry " + nodeNumber + " is empty");
        }

        String host;
        int port = defaultPort;

        if (rawPeer.contains("://")) {
            URI uri = URI.create(rawPeer);
            host = uri.getHost();
            if (host == null || host.trim().isEmpty()) {
                throw new IllegalArgumentException("Invalid peer URI: " + rawPeer);
            }
            if (uri.getPort() > 0) {
                port = uri.getPort();
            }
        } else if (rawPeer.contains(":")) {
            int lastColon = rawPeer.lastIndexOf(':');
            host = rawPeer.substring(0, lastColon).trim();
            port = Integer.parseInt(rawPeer.substring(lastColon + 1).trim());
        } else {
            host = rawPeer.trim();
        }

        return new VirtualCircle(nodeNumber, host, port, "Node" + nodeNumber);
    }

    public VirtualCircle getPeer(int nodeNumber) {
        return table[nodeNumber - 1];
    }

    public int size() {
        return table.length;
    }

    public String describe() {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < table.length; i++) {
            if (i > 0) {
                builder.append(", ");
            }
            builder.append(table[i].getNodeId())
                    .append("=")
                    .append(table[i].getDestination())
                    .append(":")
                    .append(table[i].getPort());
        }
        return builder.toString();
    }
}
