package com.springapp.mvc.controller;

import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by xiepeng on 2015/12/28.
 */

@Controller
public class LoginController {

    @Resource
    private UserDao userDao;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }


    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String doLogin(HttpServletRequest request,HttpSession session,ModelMap map){
        String uname = request.getParameter("username");
        String upasswd = request.getParameter("password");

        if (userDao.checkAdmin(uname,upasswd)) {
            session.setAttribute("identity","admin");

            return "redirect:/index";
        }

        if (userDao.checkUser(uname,upasswd)){
            session.setAttribute("identity","user");
            session.setAttribute("id",userDao.getId(uname,upasswd));

            return "redirect:/index";
        }

        map.addAttribute("error", "用户名或者密码错误");
        return "login";

    }
}
