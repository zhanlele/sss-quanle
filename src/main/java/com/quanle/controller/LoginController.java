package com.quanle.controller;

import com.quanle.pojo.Result;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

/**
 * @author quanle
 * @date 2020/3/24 12:51 AM
 */
@Controller
@RequestMapping
public class LoginController {
    /**
     * 跳转登录页
     *
     * @return
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 执行登录
     *
     * @param userName 用户名
     * @param passWord 密码
     * @param request
     * @return
     */
    @RequestMapping("/toLogin")
    @ResponseBody
    public Result<Object> login(String userName, String passWord, HttpServletRequest request) {
        if (!"admin".equals(userName)) {
            return Result.fail("该用户不存在");
        }
        if (!"admin".equals(passWord)) {
            return Result.fail("用户密码不正确");
        }
        request.getSession().setAttribute("token" , UUID.randomUUID());
        return Result.success();
    }
}
