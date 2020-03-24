package com.quanle.exception;

/**
 * @author quanle
 * @date 2020/3/24 12:56 AM
 */
public class BizException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private Integer code;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public BizException(String message) {
        super(message);
        this.code = -1;
    }
}
