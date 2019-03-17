package com.springmvc.service;

import com.springmvc.dao.ArticleMapper;
import com.springmvc.pojo.Article;
import com.springmvc.pojo.ArticleExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zdd
 * @date 2018-12-15 0:36
 */
@Service
public class ArticleService {

    @Autowired
    ArticleMapper articleMapper;

    public List<Article> getAll() {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("post_time DESC,ar.id ASC");
        ArticleExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        //屏蔽草稿箱和回收站
        List<Integer> categoryIds = new ArrayList<>();
        categoryIds.add(2);
        categoryIds.add(3);
        criteria.andCategoryIdNotIn(categoryIds);
        return articleMapper.selectByExampleWithCategory(example);
    }

    public void addArticle(Article article) {
        articleMapper.insertSelective(article);
    }

    public void deleteBatch(List<Integer> del_ids) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andIdIn(del_ids);
        articleMapper.deleteByExample(example);
    }

    public void deleteArticle(Integer id) {
        articleMapper.deleteByPrimaryKey(id);
    }

    public void removeArticle(Article article) {
        articleMapper.updateByPrimaryKey(article);
    }

    public Article getArticle(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    public void updateArticle(Article article) {
        articleMapper.updateByPrimaryKeyWithBLOBs(article);
    }

    public List<Article> getArticlesByCategory(Integer categoyId) {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("post_time DESC,ar.id ASC");
        ArticleExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andCategoryIdEqualTo(categoyId);
        return articleMapper.selectByExampleWithBLOBsAndCategory(example);
    }

    public List<Article> getSearchedArticles(String searchKeyword) {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("post_time DESC,ar.id ASC");
        ArticleExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        //屏蔽草稿箱和回收站
        List<Integer> categoryIds = new ArrayList<>();
        categoryIds.add(2);
        categoryIds.add(3);
        searchKeyword = "%" + searchKeyword + "%";  //解决中文不匹配问题
        criteria.andCategoryIdNotIn(categoryIds).andTitleLike(searchKeyword);
        return articleMapper.selectByExampleWithCategory(example);
    }

    public List<Article> getSearchedArticlesByCategory(String searchKeyword, Integer categoyId) {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("post_time DESC,ar.id ASC");
        ArticleExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        //屏蔽草稿箱和回收站
        searchKeyword = "%" + searchKeyword + "%";  //解决中文不匹配问题
        criteria.andCategoryIdEqualTo(categoyId).andTitleLike(searchKeyword);
        return articleMapper.selectByExampleWithCategory(example);
    }

    public void readArticle(Article article) {
        articleMapper.updateByPrimaryKey(article);
    }
}
