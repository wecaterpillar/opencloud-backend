package com.opencloud.common.exception;

import com.opencloud.common.constants.ResultEnum;
import com.opencloud.common.model.ResultBody;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

/**
 * 统一异常处理器
 *
 * @author LYD
 * @date 2017/7/3
 */
@ControllerAdvice
@ResponseBody
@Slf4j
public class OpenGlobalExceptionHandler {


    /**
     * 统一异常处理
     * AuthenticationException
     *
     * @param ex
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler({AuthenticationException.class})
    public static ResultBody authenticationException(Exception ex, HttpServletRequest request, HttpServletResponse response) {
        ResultBody resultBody = resolveException(ex, request.getRequestURI());
        response.setStatus(resultBody.getHttpStatus());
        return resultBody;
    }

    /**
     * OAuth2Exception
     *
     * @param ex
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler({OAuth2Exception.class, InvalidTokenException.class})
    public static ResultBody oauth2Exception(Exception ex, HttpServletRequest request, HttpServletResponse response) {
        ResultBody resultBody = resolveException(ex, request.getRequestURI());
        response.setStatus(resultBody.getHttpStatus());
        return resultBody;
    }

    /**
     * 自定义异常
     *
     * @param ex
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler({OpenException.class})
    public static ResultBody openException(Exception ex, HttpServletRequest request, HttpServletResponse response) {
        ResultBody resultBody = resolveException(ex, request.getRequestURI());
        response.setStatus(resultBody.getHttpStatus());
        return resultBody;
    }

    /**
     * 其他异常
     *
     * @param ex
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler({Exception.class})
    public static ResultBody exception(Exception ex, HttpServletRequest request, HttpServletResponse response) {
        ResultBody resultBody = resolveException(ex, request.getRequestURI());
        response.setStatus(resultBody.getHttpStatus());
        return resultBody;
    }

    /**
     * 静态解析认证异常
     *
     * @param ex
     * @return
     */
    public static ResultBody resolveOauthException(Exception ex, String path) {
        ResultEnum code = ResultEnum.BAD_CREDENTIALS;
        int httpStatus = HttpStatus.OK.value();
        String error = Optional.ofNullable(ex.getMessage()).orElse("");
        if (error.contains("User is disabled")) {
            code = ResultEnum.ACCOUNT_DISABLED;
        }
        return buildBody(ex, code, path, httpStatus);
    }

    /**
     * 静态解析异常。可以直接调用
     *
     * @param ex
     * @return
     */
    public static ResultBody resolveException(Exception ex, String path) {
        ResultEnum code = ResultEnum.ERROR;
        int httpStatus = HttpStatus.INTERNAL_SERVER_ERROR.value();
        String message = ex.getMessage();
        String superClassName = ex.getClass().getSuperclass().getName();
        String className = ex.getClass().getName();
        if (className.contains("UsernameNotFoundException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.USERNAME_NOT_FOUND;
        } else if (className.contains("BadCredentialsException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.BAD_CREDENTIALS;
        } else if (className.contains("AccountExpiredException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.ACCOUNT_EXPIRED;
        } else if (className.contains("LockedException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.ACCOUNT_LOCKED;
        } else if (className.contains("DisabledException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.ACCOUNT_DISABLED;
        } else if (className.contains("CredentialsExpiredException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.CREDENTIALS_EXPIRED;
        } else if (className.contains("InvalidClientException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.INVALID_CLIENT;
        } else if (className.contains("UnauthorizedClientException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.UNAUTHORIZED_CLIENT;
        }else if (className.contains("InsufficientAuthenticationException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.UNAUTHORIZED;
        } else if (className.contains("InvalidGrantException")) {
            code = ResultEnum.ALERT;
            if ("Bad credentials".contains(message)) {
                code = ResultEnum.BAD_CREDENTIALS;
            } else if ("User is disabled".contains(message)) {
                code = ResultEnum.ACCOUNT_DISABLED;
            } else if ("User account is locked".contains(message)) {
                code = ResultEnum.ACCOUNT_LOCKED;
            }
        } else if (className.contains("InvalidScopeException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.INVALID_SCOPE;
        } else if (className.contains("InvalidTokenException")) {
            httpStatus = HttpStatus.UNAUTHORIZED.value();
            code = ResultEnum.INVALID_TOKEN;
        } else if (className.contains("InvalidRequestException")) {
            httpStatus = HttpStatus.BAD_REQUEST.value();
            code = ResultEnum.INVALID_REQUEST;
        } else if (className.contains("RedirectMismatchException")) {
            code = ResultEnum.REDIRECT_URI_MISMATCH;
        } else if (className.contains("UnsupportedGrantTypeException")) {
            code = ResultEnum.UNSUPPORTED_GRANT_TYPE;
        } else if (className.contains("UnsupportedResponseTypeException")) {
            code = ResultEnum.UNSUPPORTED_RESPONSE_TYPE;
        } else if (className.contains("UserDeniedAuthorizationException")) {
            code = ResultEnum.ACCESS_DENIED;
        } else if (className.contains("AccessDeniedException")) {
            code = ResultEnum.ACCESS_DENIED;
            httpStatus = HttpStatus.FORBIDDEN.value();
            if (ResultEnum.ACCESS_DENIED_BLACK_LIMITED.getMessage().contains(message)) {
                code = ResultEnum.ACCESS_DENIED_BLACK_LIMITED;
            } else if (ResultEnum.ACCESS_DENIED_WHITE_LIMITED.getMessage().contains(message)) {
                code = ResultEnum.ACCESS_DENIED_WHITE_LIMITED;
            } else if (ResultEnum.ACCESS_DENIED_AUTHORITY_EXPIRED.getMessage().contains(message)) {
                code = ResultEnum.ACCESS_DENIED_AUTHORITY_EXPIRED;
            }else if (ResultEnum.ACCESS_DENIED_UPDATING.getMessage().contains(message)) {
                code = ResultEnum.ACCESS_DENIED_UPDATING;
            }else if (ResultEnum.ACCESS_DENIED_DISABLED.getMessage().contains(message)) {
                code = ResultEnum.ACCESS_DENIED_DISABLED;
            } else if (ResultEnum.ACCESS_DENIED_NOT_OPEN.getMessage().contains(message)) {
                code = ResultEnum.ACCESS_DENIED_NOT_OPEN;
            }
        } else if (className.contains("HttpMessageNotReadableException")
                || className.contains("TypeMismatchException")
                || className.contains("MissingServletRequestParameterException")) {
            httpStatus = HttpStatus.BAD_REQUEST.value();
            code = ResultEnum.BAD_REQUEST;
        } else if (className.contains("NoHandlerFoundException")) {
            httpStatus = HttpStatus.NOT_FOUND.value();
            code = ResultEnum.NOT_FOUND;
        } else if (className.contains("HttpRequestMethodNotSupportedException")) {
            httpStatus = HttpStatus.METHOD_NOT_ALLOWED.value();
            code = ResultEnum.METHOD_NOT_ALLOWED;
        } else if (className.contains("HttpMediaTypeNotAcceptableException")) {
            httpStatus = HttpStatus.BAD_REQUEST.value();
            code = ResultEnum.MEDIA_TYPE_NOT_ACCEPTABLE;
        } else if (className.contains("MethodArgumentNotValidException")) {
            BindingResult bindingResult = ((MethodArgumentNotValidException) ex).getBindingResult();
            code = ResultEnum.ALERT;
            return ResultBody.failed().code(code.getCode()).msg(bindingResult.getFieldError().getDefaultMessage());
        } else if (className.contains("IllegalArgumentException")) {
            //参数错误
            code = ResultEnum.ALERT;
            httpStatus = HttpStatus.BAD_REQUEST.value();
        } else if (className.contains("OpenAlertException")) {
            code = ResultEnum.ALERT;
        } else if (className.contains("OpenSignatureException")) {
            code = ResultEnum.SIGNATURE_DENIED;
        }else if(message.equalsIgnoreCase(ResultEnum.TOO_MANY_REQUESTS.name())){
            code = ResultEnum.TOO_MANY_REQUESTS;
        }
        return buildBody(ex, code, path, httpStatus);
    }

    /**
     * 构建返回结果对象
     *
     * @param exception
     * @return
     */
    private static ResultBody buildBody(Exception exception, ResultEnum resultCode, String path, int httpStatus) {
        if (resultCode == null) {
            resultCode = ResultEnum.ERROR;
        }
        ResultBody resultBody = ResultBody.failed().code(resultCode.getCode()).msg(exception.getMessage()).path(path).httpStatus(httpStatus);
        log.error("==> error:{} exception: {}",resultBody, exception);
        return resultBody;
    }

}
