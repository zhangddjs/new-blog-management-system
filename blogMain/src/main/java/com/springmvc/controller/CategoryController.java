package com.springmvc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springmvc.pojo.Category;
import com.springmvc.pojo.Msg;
import com.springmvc.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zdd
 * @date 2018-12-13 7:35
 */

@Controller
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    /**
     * 添加类别
     * 1、支持JSR303校验
     * 2、导入Hibernate-Validator
     *
     *
     * /category/{id} GET 查询类别
     * /category      POST 添加类别
     * /category/{id} PUT 修改类别
     * /category/{id} DELETE 删除类别
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/category", method = RequestMethod.POST)
    public Msg addCategory(@Valid Category category, BindingResult result){
        if (result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            categoryService.addCategory(category);
            return Msg.success();
        }
    }

    /**
     * 类别更新方法
     * @param category
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/category/{id}", method = RequestMethod.PUT)
    public Msg updateCategory(Category category){
        System.out.println("将要更新的类别数据，"+category);
        categoryService.updateCategory(category);
        return Msg.success();
    }

    /**
     * 根据id查询类别
     * @param id
     * @return
     */
    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getCategory(@PathVariable("id") Integer id){

        Category category = categoryService.getCategory(id);
        return Msg.success().add("category", category);
    }

    /**
     * 检查类别名是否可用
     * @param categoryName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkCategory")
    public Msg checkCategory(@RequestParam("categoryName") String categoryName){
        //数据库类别名重复校验
        boolean b = categoryService.checkCategory(categoryName);
        if (b){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg", "类别已存在");
        }
    }

    /**
     * 单个批量二合一
     * 批量删除：1-2-3
     * 单个删除：1
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/category/{id}", method = RequestMethod.DELETE)
    public Msg deleteCategory(@PathVariable("id")String ids){
        //批量删除
        if (ids.contains("-")) {
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String string : str_ids) {
                Integer id = Integer.parseInt(string);
                if (id != 1 && id != 2 && id != 3)      //其他、回收站、草稿箱
                    del_ids.add(Integer.parseInt(string));
            }
            categoryService.deleteBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            if (id != 1 && id != 2 && id != 3)      //其他、回收站、草稿箱
                categoryService.deleteCategory(id);
        }
        return Msg.success();
    }

    /**
     * 导入jackson包，获取类别列表
     * @param pn
     * @return
     */
    @RequestMapping("/categories")
    @ResponseBody
    public Msg getCategoriesWithJson(@RequestParam(value = "pn", defaultValue = "1")Integer pn){
        //这不是一个分页查询：
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页大小。
        PageHelper.startPage(pn, 5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Category> categories = categoryService.getAll();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(categories, 5);
        return Msg.success().add("pageInfo", page);         //.add.add
    }

    /**
     * 返回所有的类别信息
     */
    @RequestMapping("/articleAddOrEditCategories")
    @ResponseBody
    public Msg getCategories(){
        //查出的所有类别信息
        List<Category> list = categoryService.getCategories();
        return Msg.success().add("categories", list);
    }

    /**
     * 测试——查询类别数据（分页查询）
     * @return
     */
    @RequestMapping("/category")
    public String getCategories(@RequestParam(value = "pn", defaultValue = "1")Integer pn,
                          Model model){
        //这不是一个分页查询：
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页大小。
        PageHelper.startPage(pn, 5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Category> categories = categoryService.getAll();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(categories, 5);
        model.addAttribute("pageInfo", page);

        return "list";
    }

}
