package com.lstar.project.common;

import lombok.Data;

import java.io.Serializable;

/**
 * 通用返回类
 *
 * @param <T>
 * @author lstar
 */
@Data
public class Response<T> implements Serializable {

    private int code;

    private T data;

    private String message;

    public Response(int code, T data, String message) {
        this.code = code;
        this.data = data;
        this.message = message;
    }

    public Response(int code, T data) {
        this(code, data, "");
    }

    public Response(Code code) {
        this(code.getCode(), null, code.getMessage());
    }
}
