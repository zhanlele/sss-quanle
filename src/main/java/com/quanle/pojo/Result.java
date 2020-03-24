package com.quanle.pojo;

/**
 * 基本返回信息
 *
 * @author quanle
 */
public class Result<T> {
    private Integer code;
    private String msg;
    private T data;

    public Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public static <T> Result<T> success() {
        return new Result<>(0, "success");
    }

    public static <T> Result<T> success(T data) {
        return new Result<>(0, "success" , data);
    }

    public static <T> Result<T> fail(String msg) {
        return new Result<>(-1, msg);
    }
}
