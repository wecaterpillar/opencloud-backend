package com.opencloud.auth.provider.service.feign;

import com.opencloud.base.client.service.IBaseAppServiceClient;
import com.opencloud.base.client.constants.BaseConstants;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @author: liuyadu
 * @date: 2018/10/24 16:49
 * @description:
 */
@FeignClient(value = BaseConstants.BASE_SERVICE)
public interface BaseAppServiceClient extends IBaseAppServiceClient {


}
