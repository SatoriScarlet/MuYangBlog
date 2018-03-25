package com.muyang.entity;


import java.util.Date;

public class Diary {


    private int diaryid = 0;
    private String external_message = "";
    private String inside_message = "";
    private String text = "";
    private Date create_date = null;
    private Date alter_date = null;

    public int getDiaryId() {
        return diaryid;
    }

    public void setDiaryId(int diaryid) {
        this.diaryid = diaryid;
    }

    public String getExternal_message() {
        return external_message;
    }

    public void setExternal_message(String external_message) {
        this.external_message = external_message;
    }

    public String getInside_message() {
        return inside_message;
    }

    public void setInside_message(String inside_message) {
        this.inside_message = inside_message;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getAlter_date() {
        return alter_date;
    }

    public void setAlter_date(Date alter_date) {
        this.alter_date = alter_date;
    }
}
