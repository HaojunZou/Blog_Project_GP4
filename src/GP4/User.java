package GP4;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class User {
    private int userType;
    private String userName;
    private String email;
    private String userPassword;
    private String realName;
    private String gender;
    private String birthday;
    private String country;
    private ArrayList<String> userList;

    public User(){
    }

    public int getUserType(){
        return userType;
    }

    public void setUserType(int value){
        userType = value;
    }

    public String getUserName(){
        return userName;
    }

    public void setUserName(String value){
        userName = value;
    }

    public String getEmail(){
        return email;
    }

    public void setEmail(String value){
        email = value;
    }

    public String getUserPassword(){
        return userPassword;
    }

    public void setUserPassword(String value){
        userPassword = value;
    }

    public String getRealName(){
        return realName;
    }

    public void setRealName(String value){
        realName = value;
    }

    public String getGender(){
        return gender;
    }

    public void setGender(String value){
        gender = value;
    }

    public String getBirthday(){
        return birthday;
    }

    public void setBirthday(String value){
        birthday = value;
    }

    public String getCountry(){
        return country;
    }

    public void setCountry(String value){
        country = value;
    }

}
