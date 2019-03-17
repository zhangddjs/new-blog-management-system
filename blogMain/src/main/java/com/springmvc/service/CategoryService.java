package com.springmvc.service;

import com.springmvc.dao.CategoryMapper;
import com.springmvc.pojo.Category;
import com.springmvc.pojo.CategoryExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zdd
 * @date 2018-12-13 7:36
 */
@Service
public class CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    /**
     * 添加类别
     * @param category
     */
    public void addCategory(Category category) {
        categoryMapper.insertSelective(category);
    }

    /**
     * 查询所有类别
     * @return
     */
    public List<Category> getAll() {
        return categoryMapper.selectByExample(null);
    }

    /**
     * 检验类别名是否可用
     * @param categoryName
     * @return true:当前类别可用
     */
    public boolean checkCategory(String categoryName) {
        CategoryExample example = new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryNameEqualTo(categoryName);
        long count = categoryMapper.countByExample(example);
        return count == 0;
    }

    /**
     * 按照id查询类别
     * @param id
     * @return
     */
    public Category getCategory(Integer id) {
        Category category = categoryMapper.selectByPrimaryKey(id);
        return category;
    }

    /**
     * 类别更新
     * @param category
     */
    public void updateCategory(Category category) {
        categoryMapper.updateByPrimaryKeySelective(category);
    }

    /**
     * 类别删除
     * @param id
     */
    public void deleteCategory(Integer id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> del_ids) {
        CategoryExample example = new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andIdIn(del_ids);
        categoryMapper.deleteByExample(example);
    }

    public List<Category> getCategories() {
        List<Category> list = categoryMapper.selectByExample(null);
        return list;
    }
}
