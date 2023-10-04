package com.ss.reggie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ss.reggie.dto.SetmealDto;
import com.ss.reggie.entity.Setmeal;

import java.util.List;

public interface SetmealService extends IService<Setmeal> {
    public void saveWithDish(SetmealDto setmealDto);

    public void removeWithDish(List<Long> ids);
}
