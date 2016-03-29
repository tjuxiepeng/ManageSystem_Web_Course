package com.springapp.mvc.service;

import com.springapp.mvc.dao.UserDao;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by xiepeng on 2015/12/28.
 */

@Service
public class LoginService {

    @Resource
    private UserDao userDao;

    public ModelAndView doLogin(String loginPageUrl, String successPageUrl, String uname,
                                String upasswd, HttpSession session) {

        if (uname == null || "".equals(uname)) {
            return new ModelAndView(loginPageUrl, "error", "用户名不能为空");
        }

        if (upasswd == null || "".equals(upasswd)) {
            return new ModelAndView(loginPageUrl, "error", "密码不能为空");
        }

        if (userDao.checkAdmin(uname,upasswd)) {
            session.setAttribute("identity","admin");

            return new ModelAndView(successPageUrl,"identity","管理员");
        }

        if (userDao.checkUser(uname,upasswd)){
            session.setAttribute("identity","user");
            session.setAttribute("id",userDao.getId(uname,upasswd));
            return new ModelAndView(successPageUrl,"identity","警员");
        }

        return new ModelAndView(loginPageUrl, "error", "用户名或者密码错误");
    }

}
