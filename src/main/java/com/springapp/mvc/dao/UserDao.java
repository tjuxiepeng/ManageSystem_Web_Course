package com.springapp.mvc.dao;

import com.springapp.mvc.pojo.Criminal;
import com.springapp.mvc.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

/**
 * Created by xiepeng on 2015/12/30.
 */
@Repository
public class UserDao {
    public boolean checkAdmin(String username,String password){
        SqlSession session = getConfig();
        User temp = new User(username,password);
        User result = session.selectOne("checkAdmin", temp);
        session.close();

        if (result == null){
            return false;
        }else {
            return true;
        }
    }

    public boolean checkUser(String username,String password){
        SqlSession session = getConfig();
        User temp = new User(username,password);
        User result = session.selectOne("checkUser", temp);
        session.close();

        if (result == null){
            return false;
        }else {
            return true;
        }
    }

    public SqlSession getConfig(){
        String resource = "MyBatisConfig.xml";
        Reader reader = null;
        SqlSession session;
        try {
            reader = Resources.getResourceAsReader(resource);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder()
                .build(reader);
        session = sqlMapper.openSession();

        return session;
    }

    public List<User> getAllAdmin() {
        SqlSession session = getConfig();

        List<User> list = session.selectList("selectAllAdmins");

        session.close();

        return list;
    }

    public List<User> getAllUser() {
        SqlSession session = getConfig();

        List<User> list = session.selectList("selectAllUsers");

        session.close();

        return list;
    }

    public User getOneUser(Integer id) {
        SqlSession session = getConfig();

        User user = session.selectOne("selectOneUser",id);

        return user;
    }

    public void insertUser(User user){
        SqlSession session = getConfig();

        session.insert("addOneUser",user);
        session.commit();
        session.close();
    }

    public void deleteUser(Integer id) {
        SqlSession session = getConfig();
        session.delete("deleteOneUser",id);
        session.commit();
        session.close();
    }



    public User getOneAdmin(Integer id) {
        SqlSession session = getConfig();

        User user = session.selectOne("selectOneAdmin",id);

        return user;
    }

    public void deleteAdmin(int id) {
        SqlSession session = getConfig();
        session.delete("deleteOneAdmin",id);
        session.commit();
        session.close();
    }

    public void insertAdmin(User user) {
        SqlSession session = getConfig();

        session.insert("addOneAdmin",user);
        session.commit();
        session.close();
    }

    public int getId(String username,String password) {
        SqlSession session = getConfig();

        User user1 = new User(username,password);

        User user2 = session.selectOne("selectOneUserId",user1);

        return user2.getId();
    }
}
