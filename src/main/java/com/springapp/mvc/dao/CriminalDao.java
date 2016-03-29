package com.springapp.mvc.dao;

import com.springapp.mvc.pojo.Criminal;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

/**
 * Created by xiepeng on 2015/12/31.
 */
@Repository
public class CriminalDao {
    //返回所有通缉犯信息
    public List<Criminal> getAll(){
        SqlSession session = getConfig();

        List<Criminal> list = session.selectList("selectAllCriminals");

        session.close();

        return list;
    }

    public List<Criminal> getSome(int scope){
        SqlSession session = getConfig();
        List<Criminal> list = session.selectList("selectSomeCriminals",scope);

        return list;
    }

    public void save(Criminal criminal){
        SqlSession session = getConfig();

        session.insert("addOneCriminal",criminal);
        session.commit();
        session.close();
    }

    public void saveInto(Criminal criminal){
        SqlSession session = getConfig();
        session.insert("addOneCriminalInto",criminal);
        session.commit();
        session.close();
    }

    public void delete(int id){
        SqlSession session = getConfig();
        session.delete("deleteOneCriminal",id);
        session.commit();
        session.close();
    }

    public Criminal getOneCriminal(int id) {
        SqlSession session = getConfig();

        Criminal criminal = session.selectOne("selectOneCriminal",id);

        return criminal;
    }

    public Criminal getOneCriminalByNum(String num){
        SqlSession session = getConfig();

        Criminal criminal = session.selectOne("selectOneCriminalByNum",num);

        return criminal;
    }

    public int getTotalCount(){
        SqlSession session = getConfig();

        int total = session.selectOne("selectTotalCriminalCount");
        return total;
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
}
