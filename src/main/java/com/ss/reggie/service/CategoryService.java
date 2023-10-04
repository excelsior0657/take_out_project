package com.ss.reggie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ss.reggie.entity.Category;

public interface CategoryService extends IService<Category> {
    public void remove(Long id);
}
