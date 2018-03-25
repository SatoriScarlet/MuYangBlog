package com.muyang.entity;

import java.util.Date;

public class OTM {

    private int OTMId = 0;
    private String OTMName = null;
    private String OTMType = null;
    private Date OTMCreateTime = null;
    private String OTMIntro = null;
    private String OTMDownloadLink = null;

    public int getOTMId() {
        return OTMId;
    }

    public void setOTMId(int OTMId) {
        this.OTMId = OTMId;
    }

    public String getOTMName() {
        return OTMName;
    }

    public void setOTMName(String OTMName) {
        this.OTMName = OTMName;
    }

    public String getOTMType() {
        return OTMType;
    }

    public void setOTMType(String OTMType) {
        this.OTMType = OTMType;
    }

    public Date getOTMCreateTime() {
        return OTMCreateTime;
    }

    public void setOTMCreateTime(Date OTMCreateTime) {
        this.OTMCreateTime = OTMCreateTime;
    }

    public String getOTMIntro() {
        return OTMIntro;
    }

    public void setOTMIntro(String OTMIntro) {
        this.OTMIntro = OTMIntro;
    }

    public String getOTMDownloadLink() {
        return OTMDownloadLink;
    }

    public void setOTMDownloadLink(String OTMDownloadLink) {
        this.OTMDownloadLink = OTMDownloadLink;
    }
}
