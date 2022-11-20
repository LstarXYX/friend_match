package com.lstar.project.exception;

import com.lstar.project.common.Code;

/**
 * 自定义异常类
 *
 * @author lstar
 */
public class AppException extends RuntimeException {

    private final int code;

    public AppException(int code, String message) {
        super(message);
        this.code = code;
    }

    public AppException(Code code) {
        super(code.getMessage());
        this.code = code.getCode();
    }

    public AppException(Code code, String message) {
        super(message);
        this.code = code.getCode();
    }

    public int getCode() {
        return code;
    }
}
