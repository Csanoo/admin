package main.java.admin.satelite.kr;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import main.java.common.satelite.kr.SearchVO;
import main.java.admin.satelite.kr.ContentsVO;
import main.java.common.satelite.kr.FileVO;

@Service
public class ContentsSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private DataSourceTransactionManager txManager;

    public ContentsVO selectContentsOne(ContentsVO param) {
        return sqlSession.selectOne("selectcontentsOne", param);
    }

    public ContentsVO selectContentsOne(String param) {
        return sqlSession.selectOne("selectcontentsOne", param);
    }


    public void insertContentsOne(ContentsVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {

            sqlSession.insert("insertcontentsOne", param);

            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }
    }



    public void updatecontents(ContentsVO param, List<FileVO> filelist,
                              String[] fileno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);



        try {
            sqlSession.update("updatecontentsOne", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }


    }


    public Integer selectContentsCount(SearchVO param) {
        return sqlSession.selectOne("selectcontentsCount", param);
    }

    public List<?> selectContentsList(SearchVO param) {

        return sqlSession.selectList("selectcontentsList", param);
    }


    public Integer selectAppMain2Count(SearchVO param) {
        return sqlSession.selectOne("selectAppMain2Count", param);
    }

    public List<?> selectAppMain2List(SearchVO param) {

        return sqlSession.selectList("selectAppMain2List", param);
    }


    public List<?> selectCateSelList(SearchVO param) {

        return sqlSession.selectList("selectCateSelList", param);
    }

    public List<?> selectSourceSelList(SearchVO param) {

        return sqlSession.selectList("selectSourceSelList", param);
    }

    public void contentsDelete(String param) {

        sqlSession.delete("contentsDelete", param);
    }

    public void chkContentsDelete(String param) {

        sqlSession.delete("chkContentsDelete", param);
    }



    public void notContentsPublish(String param) {

        sqlSession.delete("notContentsPublish", param);
    }


}
