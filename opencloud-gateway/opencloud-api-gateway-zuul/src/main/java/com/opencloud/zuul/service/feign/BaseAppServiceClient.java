package com.opencloud.zuul.service.feign;

import com.opencloud.base.client.service.IBaseAppServiceClient;
import com.opencloud.base.client.constants.BaseConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;

/**
 * @author: liuyadu
 * @date: 2018/10/24 16:49
 * @description:
 */
@Component
@FeignClient(value = BaseConstants.BASE_SERVICE)
public interface BaseAppServiceClient extends IBaseAppServiceClient {


}
