package com.opencloud.app.opensite.provider.service.feign;

import com.opencloud.base.client.constants.BaseConstants;
import com.opencloud.base.client.service.IBaseDeveloperServiceClient;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @author: liuyadu
 * @date: 2018/10/24 16:49
 * @description:
 */
@FeignClient(value = BaseConstants.BASE_SERVICE)
public interface BaseDeveloperServiceClient extends IBaseDeveloperServiceClient {


}
