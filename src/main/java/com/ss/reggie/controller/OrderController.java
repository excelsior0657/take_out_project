package com.ss.reggie.controller;

import com.ss.reggie.common.R;
import com.ss.reggie.entity.Orders;
import com.ss.reggie.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 订单
 */
@Slf4j
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 用户下单
     * @param orders
     * @return
     */
//    @PostMapping("/submit")
//    public R<String> submit(@RequestBody Orders orders){
//        log.info("订单数据：{}",orders);
//        orderService.submit(orders);
//        return R.success("下单成功");
//    }

    //用户下单
    @PostMapping("/submit")
    public R<String> submit(@RequestBody Orders orders){
        log.info("订单数据:{}",orders);
        orderService.submit(orders);
        return R.success("下单成功");
    }

}