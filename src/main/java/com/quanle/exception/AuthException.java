package com.quanle.exception;

/**
 * @author quanle
 * @date 2020/3/24 12:57 AM
 */
public class AuthException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private Integer code;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public AuthException(String message) {
        super(message);
        this.code = -1;
    }
}
