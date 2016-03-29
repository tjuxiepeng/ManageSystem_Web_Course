package com.springapp.mvc.dao;

import com.springapp.mvc.pojo.Criminal;
import com.springapp.mvc.pojo.CriminalInfo;
import com.springapp.mvc.pojo.SearchCondition;
import com.springapp.mvc.pojo.SearchSqlCondition;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

/**
 * Created by xiepeng on 2016/1/9.
 */
@Repository
public class NewCriminalDao {
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

    public List<CriminalInfo> getAll(){
        SqlSession session = getConfig();

        List<CriminalInfo> list = session.selectList("selectAllNewCriminals");

        session.close();

        return list;
    }

    public void addOneCriminal(CriminalInfo criminalInfo){
        SqlSession session = getConfig();
        session.insert("addOneNewCriminal",criminalInfo);
        session.commit();
        session.close();
    }

//    public List<Criminal> getCriminalByCondition(SearchSqlCondition condition){
//        SqlSession session = getConfig();
//        List<Criminal> list = session.selectList("selectCriminalsByCondition",condition);
//        session.close();
//
//        return list;
//    }

    public void deleteOneNewCriminal(Integer id) {
        SqlSession session = getConfig();
        session.delete("deleteOneNewCriminal",id);
        session.commit();
        session.close();
    }

    public int getTotalCount(SearchSqlCondition condition){
        SqlSession session = getConfig();

        int total = session.selectOne("selectTotalNewCriminalCount",condition);
        return total;
    }

    public List<Criminal> getSome(SearchSqlCondition condition){
        SqlSession session = getConfig();
        List<Criminal> list = session.selectList("selectSomeCriminalsByCondition",condition);

        return list;
    }
}
