package tech.codingclub.helix.entity;

public class SignupResponce {
    public  String message;
    public Boolean user_created;

    public SignupResponce(String message,Boolean user_created){
        this.message=message;
        this.user_created=user_created;
    }
}
