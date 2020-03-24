package com.quanle.controller;

import com.quanle.exception.AuthException;
import com.quanle.exception.BizException;
import com.quanle.pojo.Result;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author quanle
 * @date 2020/3/24 12:53 AM
 */
@ControllerAdvice
public class GlobalExceptionResolver {
    /**
     * 业务异常，页面提示业务错误信息
     *
     * @param exception 业务异常
     * @return
     */
    @ExceptionHandler(BizException.class)
    public Result<Object> handleBizException(BizException exception) {
        return new Result<>(exception.getCode(), exception.getMessage());
    }

    /**
     * 其他异常，页面提示业系统异常
     *
     * @param exception 异常
     * @return
     */
    @ExceptionHandler(Exception.class)
    public Result<Object> handleException(Exception exception) {
        return new Result<>(-1, "系统异常，请联系管理员");
    }

    /**
     * 登录异常，调整登录英文名
     *
     * @param exception 登录异常
     * @return
     */
    @ExceptionHandler(AuthException.class)
    public ModelAndView handleAuthException(AuthException exception) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("msg" , exception.getMessage());
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
