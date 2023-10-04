package com.ss.reggie.dto;

import com.ss.reggie.entity.Setmeal;
import com.ss.reggie.entity.SetmealDish;
import lombok.Data;
import java.util.List;

@Data
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes;

    private String categoryName;
}
