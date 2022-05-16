package tech.codingclub.helix.controller;

import org.apache.log4j.Logger;
import org.jooq.Condition;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import tech.codingclub.helix.database.GenericDB;
import tech.codingclub.helix.entity.LoginResponce;
import tech.codingclub.helix.entity.Member;
import tech.codingclub.helix.entity.SignupResponce;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * User: rishabh
 */
@Controller
@RequestMapping("/login")
public class Logincontroller extends BaseController {

    private static Logger logger = Logger.getLogger(Logincontroller.class);

    @RequestMapping(method = RequestMethod.GET, value = "/adminlogin")
    public String adminlogin(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "adminlogin";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/userlogin")
    public String userlogin(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "userlogin";
    }
    @RequestMapping(method = RequestMethod.GET, value = "/songlist")
    public String songlist(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "songpg";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/songlist")
    public
    @ResponseBody
    SignupResponce songdata(@RequestBody  Member member, HttpServletRequest request, HttpServletResponse response) {
        boolean user_created=false;
        String message="";

        if (GenericDB.getCount(tech.codingclub.helix.tables.Member.MEMBER, tech.codingclub.helix.tables.Member.MEMBER.EMAIL.eq(member.email)) > 0) {

            message = "user already exist for this  email id!";
        }else {

            member.role="cm";
            new GenericDB<Member>().addRow(tech.codingclub.helix.tables.Member.MEMBER,member);
            user_created=true;
            message="User Created !";
        }
        return new SignupResponce(message,user_created);

    }


    @RequestMapping(method = RequestMethod.GET, value = "/welcome")
    public String welcome(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "welcomelogin" ;
    }
    @RequestMapping(method = RequestMethod.POST, value = "/welcome")
    public
    @ResponseBody
    LoginResponce hindledata(@RequestBody Member member, HttpServletRequest request, HttpServletResponse response) {
        Condition condition = tech.codingclub.helix.tables.Member.MEMBER.EMAIL.eq(member.email).and(tech.codingclub.helix.tables.Member.MEMBER.PASSWORD.eq(member.password));
        List<Member> x = (List<Member>) GenericDB.getRows(tech.codingclub.helix.tables.Member.MEMBER, Member.class, condition, 1);
        if (x != null &&     x.size() > 0) {
            //condition is meet! email and password
            Member memberTemp = x.get(0);
            memberTemp.role="cm";
            ControllerUtils.setUserSession(request,memberTemp);
            return new LoginResponce("Logined successfully", true, memberTemp.id);
        } else {
            //user does not exist!!
            //wroncombimation
            return new LoginResponce( "wrong combination",false,null);
        }
    }
}