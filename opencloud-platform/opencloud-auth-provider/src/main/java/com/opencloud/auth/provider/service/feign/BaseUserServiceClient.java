package com.opencloud.auth.provider.service.feign;

import com.opencloud.base.client.constants.BaseConstants;
import com.opencloud.base.client.service.IBaseUserServiceClient;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @author: liuyadu
 * @date: 2018/10/24 16:49
 * @description:
 */
@FeignClient(value = BaseConstants.BASE_SERVICE)
public interface BaseUserServiceClient extends IBaseUserServiceClient {


}
