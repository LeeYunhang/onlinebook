package entity;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * Created by 云航 on 2015/11/28.
 */
public class User {
    private String userName = "";
    private String password = "";
    private String phoneNumber = "";
    private String realName = "";
    private String postCode = "";
    private String balance = "";

    public User (String name, String password, String number, String realName, String postCode) {
        this.userName = name;
        this.password = password;
        this.phoneNumber = number;
        this.realName = realName;
        this.postCode = postCode;
        try {
            userName = URLEncoder.encode(userName, "iso-8859-1");
            userName = URLDecoder.decode(userName, "utf-8");
            this.realName = URLEncoder.encode(this.realName, "iso-8859-1");
            this.realName = URLDecoder.decode(this.realName, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        balance = "1000";
    }
    public User() {

    }

    public int getBalance () {
        return Integer.parseInt(balance);
    }

    public void setBalance(int balance) {
        this.balance = balance + "";
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    @Override
    public String toString () {
        return "'" + userName + "','" + password + "','" + phoneNumber + "','" + realName + "','" + postCode + "','" + balance + "'";
    }
}
