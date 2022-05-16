package tech.codingclub.helix.entity;

public class LoginResponce {

    public Long id;
    public String message;
    public Boolean is_Logined;

    public LoginResponce(){

    }

    public LoginResponce(String message, Boolean is_Logined, Long id){
        this.id=id;
        this.is_Logined=is_Logined;
        this.message=message;
    }

}
