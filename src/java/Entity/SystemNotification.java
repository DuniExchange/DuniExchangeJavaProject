/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class SystemNotification {

    private int notiID;
    private int userID;
    private int firstPostID;
    private int secondPostID;
    private int notiType;
    private Date notiDat;
    private int toUserID;
    private int expired;
    private int seen;

    public SystemNotification() {
    }

    public SystemNotification(int notiID, int userID, int firstPostID, int secondPostID, int notiType, Date notiDat, int toUserID, int expired, int seen) {
        this.notiID = notiID;
        this.userID = userID;
        this.firstPostID = firstPostID;
        this.secondPostID = secondPostID;
        this.notiType = notiType;
        this.notiDat = notiDat;
        this.toUserID = toUserID;
        this.expired = expired;
        this.seen = seen;
    }

    public int getNotiID() {
        return notiID;
    }

    public void setNotiID(int notiID) {
        this.notiID = notiID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getFirstPostID() {
        return firstPostID;
    }

    public void setFirstPostID(int firstPostID) {
        this.firstPostID = firstPostID;
    }

    public int getSecondPostID() {
        return secondPostID;
    }

    public void setSecondPostID(int secondPostID) {
        this.secondPostID = secondPostID;
    }

    public int getNotiType() {
        return notiType;
    }

    public void setNotiType(int notiType) {
        this.notiType = notiType;
    }

    public Date getNotiDat() {
        return notiDat;
    }

    public void setNotiDat(Date notiDat) {
        this.notiDat = notiDat;
    }

    public int getToUserID() {
        return toUserID;
    }

    public void setToUserID(int toUserID) {
        this.toUserID = toUserID;
    }

    public int getExpired() {
        return expired;
    }

    public void setExpired(int expired) {
        this.expired = expired;
    }

    public int getSeen() {
        return seen;
    }

    public void setSeen(int seen) {
        this.seen = seen;
    }

    @Override
    public String toString() {
        return "SystemNotification{" + "notiID=" + notiID + ", userID=" + userID + ", firstPostID=" + firstPostID + ", secondPostID=" + secondPostID + ", notiType=" + notiType + ", notiDat=" + notiDat + ", toUserID=" + toUserID + ", expired=" + expired + ", seen=" + seen + '}';
    }

     
}
