package org.gandharva.gandharva.model;

import org.gandharva.gandharva.constants.RequestType;

import java.sql.Date;
import java.util.UUID;

public class Request {
    private UUID id;
    private Date startDate;
    private Date deadline;
    private byte[] horoscope; // Assuming blob is represented as a byte array
    private RequestType status;
    private String comments;
    private String feedback;
    private UUID userId;
    private UUID astrologerId;

    public Request() {}

    public Request(Date startDate, Date deadline, byte[] horoscope, RequestType status, String comments, String feedback, UUID userId, UUID astrologerId) {
        this.id = UUID.randomUUID();
        this.startDate = startDate;
        this.deadline = deadline;
        this.horoscope = horoscope;
        this.status = status;
        this.comments = comments;
        this.feedback = feedback;
        this.userId = userId;
        this.astrologerId = astrologerId;
    }

    public Request(UUID id, Date startDate, Date deadline, byte[] horoscope, RequestType status, String comments, String feedback, UUID userId, UUID astrologerId) {
        this.id = id;
        this.startDate = startDate;
        this.deadline = deadline;
        this.horoscope = horoscope;
        this.status = status;
        this.comments = comments;
        this.feedback = feedback;
        this.userId = userId;
        this.astrologerId = astrologerId;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public byte[] getHoroscope() {
        return horoscope;
    }

    public void setHoroscope(byte[] horoscope) {
        this.horoscope = horoscope;
    }

    public RequestType getStatus() {
        return status;
    }

    public void setStatus(RequestType status) {
        this.status = status;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public UUID getAstrologerId() {
        return astrologerId;
    }

    public void setAstrologerId(UUID astrologerId) {
        this.astrologerId = astrologerId;
    }
}
