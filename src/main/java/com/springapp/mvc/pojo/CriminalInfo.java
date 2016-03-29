package com.springapp.mvc.pojo;

/**
 * Created by xiepeng on 2016/1/9.
 */
public class CriminalInfo {
    private int id;
    private String title;
    private String content;
    private String phone;
    private String name;

    public CriminalInfo(){

    }


    public CriminalInfo(int id, String title, String content, String phone, String name) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.phone = phone;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
