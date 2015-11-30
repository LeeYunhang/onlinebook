package entity;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * Created by 云航 on 2015/11/28.
 */
public class Book {
    private int id;
    private String name;
    private String auther;
    private double price;
    private String type;
    private String publish;
    private String description;

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    private int inventory;
    private String path;       //书的图片的路径

    public Book(int id, String name, String auther, double price, String type, String publish, String description, int inventory) {
        this.id = id;
        this.name = name;
        this.auther = auther;
        this.price = price;
        this.type = type;
        this.publish = publish;
        this.description = description;
        this.inventory = inventory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuther() {
        return auther;
    }

    public void setAuther(String auther) {
        this.auther = auther;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString () {
        return "'" + name + "','" + auther + "'," + price + ",'" + type + "','" +
                publish + "','" + description + "'," + id + ",'" + path + "'";
    }
}
