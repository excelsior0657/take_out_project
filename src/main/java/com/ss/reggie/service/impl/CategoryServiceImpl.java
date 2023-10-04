package com.ss.reggie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ss.reggie.common.CustomException;
import com.ss.reggie.entity.Category;
import com.ss.reggie.entity.Dish;
import com.ss.reggie.entity.Setmeal;
import com.ss.reggie.mapper.CategoryMapper;
import com.ss.reggie.service.CategoryService;
import com.ss.reggie.service.DishService;
import com.ss.reggie.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private DishService dishService;
    @Autowired
    private SetmealService setmealService;

    @Override
    public void remove(Long id) {
        LambdaQueryWrapper<Dish> dishLambdaQueryWrapper=new LambdaQueryWrapper<>();
        LambdaQueryWrapper<Setmeal> setmealLambdaQueryWrapper=new LambdaQueryWrapper<>();

        // 添加查询条件，根据分类id进行查询
        dishLambdaQueryWrapper.eq(Dish::getCategoryId,id);
        setmealLambdaQueryWrapper.eq(Setmeal::getCategoryId,id);
        int count1=dishService.count(dishLambdaQueryWrapper);
        int count2=setmealService.count(setmealLambdaQueryWrapper);

        // 查询当前分类是否关联了菜品，如果已经关联，则抛出一个业务异常
        if(count1>0){
            throw new CustomException("当前分类下关联了菜品，不能删除");
        }
        // 查询当前分类是否关联了套餐，如果已经关联，则抛出一个业务异常
        if(count2>0){
            throw new CustomException("当前分类下关联了套餐，不能删除");
        }

        // 正常删除分类
        super.removeById(id);
    }
}
