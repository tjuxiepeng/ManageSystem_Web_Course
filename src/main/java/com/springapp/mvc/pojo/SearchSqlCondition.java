package com.springapp.mvc.pojo;

/**
 * Created by xiepeng on 2016/1/16.
 */
public class SearchSqlCondition {
    private String name;
    private String num;
    private int minHeight;
    private int maxHeight;
    private int minWeight;
    private int maxWeight;

    public SearchSqlCondition(){

    }

    public int getScope() {
        return scope;
    }

    public void setScope(int scope) {
        this.scope = scope;
    }

    private int scope;

    public SearchSqlCondition(String name, String num, int minHeight,
                              int maxHeight, int minWeight, int maxWeight) {
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

    public int getMinHeight() {
        return minHeight;
    }

    public void setMinHeight(int minHeight) {
        this.minHeight = minHeight;
    }

    public int getMaxHeight() {
        return maxHeight;
    }

    public void setMaxHeight(int maxHeight) {
        this.maxHeight = maxHeight;
    }

    public int getMinWeight() {
        return minWeight;
    }

    public void setMinWeight(int minWeight) {
        this.minWeight = minWeight;
    }

    public int getMaxWeight() {
        return maxWeight;
    }

    public void setMaxWeight(int maxWeight) {
        this.maxWeight = maxWeight;
    }
}
