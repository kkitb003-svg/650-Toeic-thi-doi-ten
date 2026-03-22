package server;

public class ProcessData {

    public enum Operation {
        PRINT,
        CANCEL
    }

    private final Operation operation;
    private final String jobId;
    private final String documentContent;
    private final String requestedBy;
    private final int requestedNode;
    private final long submittedLamport;
    private final long submittedAt;

    private ProcessData(Operation operation, String jobId, String documentContent, String requestedBy,
                        int requestedNode, long submittedLamport, long submittedAt) {
        this.operation = operation;
        this.jobId = jobId;
        this.documentContent = documentContent;
        this.requestedBy = requestedBy;
        this.requestedNode = requestedNode;
        this.submittedLamport = submittedLamport;
        this.submittedAt = submittedAt;
    }

    public static ProcessData parsePrintPayload(String payload, int requestedNode, long lamport) {
        if (payload == null) {
            return null;
        }

        String[] parts = payload.split("\\|", 2);
        if (parts.length < 2) {
            return null;
        }

        String jobId = parts[0].trim();
        String documentContent = parts[1].trim();
        String requestedBy = "client";

        if (jobId.isEmpty() || documentContent.isEmpty()) {
            return null;
        }

        return new ProcessData(Operation.PRINT, jobId, documentContent, requestedBy, requestedNode,
                lamport, System.currentTimeMillis());
    }

    public static ProcessData cancelRequest(String jobId, int requestedNode, long lamport) {
        if (jobId == null || jobId.trim().isEmpty()) {
            return null;
        }

        return new ProcessData(Operation.CANCEL, jobId.trim(), "", "client", requestedNode,
                lamport, System.currentTimeMillis());
    }

    public Operation getOperation() {
        return operation;
    }

    public String getJobId() {
        return jobId;
    }

    public String getDocumentContent() {
        return documentContent;
    }

    public String getRequestedBy() {
        return requestedBy;
    }

    public int getRequestedNode() {
        return requestedNode;
    }

    public long getSubmittedLamport() {
        return submittedLamport;
    }

    public long getSubmittedAt() {
        return submittedAt;
    }
}
