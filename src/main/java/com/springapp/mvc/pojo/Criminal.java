package com.springapp.mvc.pojo;

/**
 * Created by xiepeng on 2015/12/31.
 */
public class Criminal {
    private int id;
    private String criminalname;
    private String gender;
    private String num;
    private int height;
    private int weight;
    private String body;
    private String phone;
    private String photo;

    public Criminal(){

    }


    public Criminal(int id, String criminalname, String gender, String num,
                    int height, int weight, String body, String phone, String photo) {
        this.id = id;
        this.criminalname = criminalname;
        this.gender = gender;
        this.num = num;
        this.height = height;
        this.weight = weight;
        this.body = body;
        this.phone = phone;
        this.photo = photo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCriminalname() {
        return criminalname;
    }

    public void setCriminalname(String criminalname) {
        this.criminalname = criminalname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
