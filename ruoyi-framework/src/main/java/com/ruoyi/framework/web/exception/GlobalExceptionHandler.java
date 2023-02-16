package com.ruoyi.framework.web.exception;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import com.ruoyi.common.core.domain.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.exception.DemoModeException;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 全局异常处理器
 * 
 * @author ruoyi
 */
@RestControllerAdvice
public class GlobalExceptionHandler
{
    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 权限校验异常
     */
    @ExceptionHandler(AccessDeniedException.class)
    public AjaxResult handleAccessDeniedException(AccessDeniedException e, HttpServletRequest request)
    {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',权限校验失败'{}'", requestURI, e.getMessage());
        return AjaxResult.error(HttpStatus.FORBIDDEN, "没有权限，请联系管理员授权");
    }

    /**
     * 请求方式不支持
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public AjaxResult handleHttpRequestMethodNotSupported(HttpRequestMethodNotSupportedException e,
            HttpServletRequest request)
    {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',不支持'{}'请求", requestURI, e.getMethod());
        return AjaxResult.error(e.getMessage());
    }

    /**
     * 业务异常
     */
    @ExceptionHandler(ServiceException.class)
    public AjaxResult handleServiceException(ServiceException e, HttpServletRequest request)
    {
        log.error(e.getMessage(), e);
        Integer code = e.getCode();
        return StringUtils.isNotNull(code) ? AjaxResult.error(code, e.getMessage()) : AjaxResult.error(e.getMessage());
    }

    /**
     * 拦截未知的运行时异常
     */
    @ExceptionHandler(RuntimeException.class)
    public AjaxResult handleRuntimeException(RuntimeException e, HttpServletRequest request)
    {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',发生未知异常.", requestURI, e);
        return AjaxResult.error(e.getMessage());
    }

    /**
     * 系统异常
     */
    @ExceptionHandler(Exception.class)
    public AjaxResult handleException(Exception e, HttpServletRequest request)
    {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',发生系统异常.", requestURI, e);
        return AjaxResult.error(e.getMessage());
    }

    /**
     * 自定义验证异常
     */
    @ExceptionHandler(BindException.class)
    public AjaxResult handleBindException(BindException e)
    {
        log.error(e.getMessage(), e);
        String message = e.getAllErrors().get(0).getDefaultMessage();
        return AjaxResult.error(message);
    }

    /**
     * 自定义验证异常
     */
//    @ExceptionHandler(MethodArgumentNotValidException.class)
//    public Object handleMethodArgumentNotValidException(MethodArgumentNotValidException e)
//    {
//        log.error(e.getMessage(), e);
//        String message = e.getBindingResult().getFieldError().getDefaultMessage();
//        return AjaxResult.error(message);
//    }

    /**
     * 自定义验证异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public AjaxResult handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        log.error("Method Argument NotValid Exception", e);

        return handleDTOResponse(e.getBindingResult());
    }

    /**
     * 校验单个数据错误
     */
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseBody
    public AjaxResult handleConstraintViolationException(ConstraintViolationException e) {
        log.error("handle Constraint Violation Exception", e);

        return handleParamResponse(e.getConstraintViolations());
    }

    /*开发时使用*/
    @ExceptionHandler(HttpMessageNotReadableException.class)
    @ResponseBody
    public AjaxResult handleInvalidFormatException(HttpMessageNotReadableException e) {
        log.error("handle Invalid Format Exception", e);

        return handleInvalidFormat(e.getCause());
    }

    /**
     * 演示模式异常
     */
    @ExceptionHandler(DemoModeException.class)
    public AjaxResult handleDemoModeException(DemoModeException e)
    {
        return AjaxResult.error("演示模式，不允许操作");
    }

    /**
     * 校验DTO数据错误
     *
     * @param bindingResult 错误数组
     * @return 返回响应类型
     */
    private AjaxResult handleDTOResponse(BindingResult bindingResult) {
        ArrayList<String> list = new ArrayList<>();

        if (bindingResult.hasErrors()) {
            /*获取错误的数组*/
            List<ObjectError> errors = bindingResult.getAllErrors();

            for (ObjectError error : errors) {
                list.add(error.getDefaultMessage());
            }
        }

        if (list.size() == 0) {
            return AjaxResult.error(HttpStatus.ERROR,"参数错误");
        }

        return AjaxResult.error(HttpStatus.ERROR, list.toString());
    }

    /**
     * 校验单个数据错误
     *
     * @param constraintViolations 错误数组
     * @return 返回响应类型
     */
    private AjaxResult handleParamResponse(Set<ConstraintViolation<?>> constraintViolations) {
        ArrayList<String> list = new ArrayList<>();

        if (constraintViolations.size() > 0) {
            for (ConstraintViolation<?> ConstraintViolation : constraintViolations) {
                list.add(ConstraintViolation.getMessage());
            }
        }

        if (list.size() == 0) {
            return AjaxResult.error(HttpStatus.ERROR,"参数错误");
        }

        return AjaxResult.error(HttpStatus.ERROR, list.toString());
    }

    /**
     * 参数格式错误(开发时使用)
     *
     * @param cause 错误对象
     * @return 返回枚举错误类型
     */
    private AjaxResult handleInvalidFormat(Throwable cause) {

        return AjaxResult.error(HttpStatus.ERROR, cause.getMessage());
    }
}
