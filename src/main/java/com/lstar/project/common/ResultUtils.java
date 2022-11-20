package com.lstar.project.common;

/**
 * 返回工具类
 *
 * @author lstar
 */
public class ResultUtils {

    /**
     * 成功
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> Response<T> success(T data) {
        return new Response<>(0, data, "ok");
    }

    /**
     * 失败
     *
     * @param code
     * @return
     */
    public static Response error(Code code) {
        return new Response<>(code);
    }

    /**
     * 失败
     *
     * @param code
     * @param message
     * @return
     */
    public static Response error(int code, String message) {
        return new Response(code, null, message);
    }

    /**
     * 失败
     *
     * @param code
     * @return
     */
    public static Response error(Code code, String message) {
        return new Response(code.getCode(), null, message);
    }
}
