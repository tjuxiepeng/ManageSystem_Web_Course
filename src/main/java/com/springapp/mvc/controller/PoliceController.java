package com.springapp.mvc.controller;

import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.pojo.Criminal;
import com.springapp.mvc.pojo.User;
import com.sun.deploy.net.HttpResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.View;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

/**
 * Created by xiepeng on 2016/1/16.
 */
@Controller
public class PoliceController {
    @Resource
    private UserDao userDao;

    @RequestMapping("/police_list")
    public String criminalList(Map<String,Object> map,HttpSession session) throws IOException {
        if (session.getAttribute("identity").equals("admin")){
            map.put("admin",userDao.getAllAdmin());
            map.put("user",userDao.getAllUser());

            return "police_list";
        }else {
            ArrayList<User> list = new ArrayList<User>();
            User user = userDao.getOneUser((Integer) session.getAttribute("id"));
            list.add(user);
            map.put("user",list);

            return "police_my";
        }
    }

    @RequestMapping(value = "/user_modify/{id}",method = RequestMethod.GET)
    public String modify_police(@PathVariable("id") Integer id,Map<String,Object> map,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }

        map.put("user",userDao.getOneUser(id));

        return "police_add";
    }

    //编辑后保存
    @RequestMapping(value = "/user_save",method = RequestMethod.POST)
    public String savePolice(User user,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }


        userDao.deleteUser(user.getId());
        userDao.insertUser(user);

        return "redirect:/police_list";
    }

    //在列表界面删除一条信息
    @RequestMapping("/user_delete/{id}")
    public String deletePolice(@PathVariable("id") Integer id){
        userDao.deleteUser(id);

        return "redirect:/police_list";
    }

    @RequestMapping(value = "/user_add",method = RequestMethod.GET)
    public String userAdd(Map<String, Object> map,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity == "admin"){
            return "redirect:/login";
        }

        map.put("user",new User());

        return "police_add";
    }

    @RequestMapping(value = "/admin_down/{id}")
    public String downAdmin(@PathVariable("id") Integer id){
        User user1 = userDao.getOneAdmin(id);
        User user2 = new User(user1.getUsername(),user1.getPassword());
        userDao.deleteAdmin(id);
        userDao.insertUser(user2);

        return "redirect:/police_list";
    }

    @RequestMapping(value = "/user_up/{id}")
    public String upPolice(@PathVariable("id") Integer id){
        User user1 = userDao.getOneUser(id);
        User user2 = new User(user1.getUsername(),user1.getPassword());
        userDao.deleteUser(id);
        userDao.insertAdmin(user2);

        return "redirect:/police_list";
    }



    @RequestMapping(value = "/admin_modify/{id}",method = RequestMethod.GET)
    public String modify_damin(@PathVariable("id") Integer id,Map<String,Object> map){
        map.put("admin",userDao.getOneAdmin(id));

        return "admin_add";
    }

    //编辑后保存
    @RequestMapping(value = "/admin_save",method = RequestMethod.POST)
    public String saveAdmin(User user){
        userDao.deleteAdmin(user.getId());
        userDao.insertAdmin(user);

        return "redirect:/police_list";
    }

    //在列表界面删除一条信息
    @RequestMapping("/admin_delete/{id}")
    public String deleteAdmin(@PathVariable("id") Integer id){
        userDao.deleteAdmin(id);

        return "redirect:/police_list";
    }

    @RequestMapping(value = "/admin_add",method = RequestMethod.GET)
    public String adminAdd(Map<String, Object> map){
        map.put("admin",new User());

        return "admin_add";
    }
}
