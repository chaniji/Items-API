package com.chan.Items.DTO;

public class Items {
    private int id;
    private String name;
    private String Descriptions;
    private String Price;
    public Items(int id, String name, String Descriptions, String Price){
        this.id=id;
        this.name=name;
        this.Descriptions=Descriptions;
        this.Price=Price;
    }
    public int getId(){
        return id;
    }
    public String getName(){
         return name;
    }
    public String getDescriptions(){
        return Descriptions;
    }
    public String getPrice(){
        return  Price;
    }
}
