package com.springapp.mvc.pojo;

/**
 * Created by xiepeng on 2016/1/9.
 */
public class SearchCondition {
    private String name;
    private String num;
    private String minHeight;
    private String maxHeight;
    private String minWeight;
    private String maxWeight;

    public SearchCondition(){

    }


    public SearchCondition(String name, String num, String minHeight,
                           String maxHeight, String minWeight, String maxWeight) {
        this.name = name;
        this.num = num;
        this.minHeight = minHeight;
        this.maxHeight = maxHeight;
        this.minWeight = minWeight;
        this.maxWeight = maxWeight;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getMinHeight() {
        return minHeight;
    }

    public void setMinHeight(String minHeight) {
        this.minHeight = minHeight;
    }

    public String getMaxHeight() {
        return maxHeight;
    }

    public void setMaxHeight(String maxHeight) {
        this.maxHeight = maxHeight;
    }

    public String getMinWeight() {
        return minWeight;
    }

    public void setMinWeight(String minWeight) {
        this.minWeight = minWeight;
    }

    public String getMaxWeight() {
        return maxWeight;
    }

    public void setMaxWeight(String maxWeight) {
        this.maxWeight = maxWeight;
    }
}

