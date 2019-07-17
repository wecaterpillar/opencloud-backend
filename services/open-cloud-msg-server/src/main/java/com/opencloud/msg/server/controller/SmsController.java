package com.opencloud.msg.server.controller;

import com.opencloud.common.model.ResultBody;
import com.opencloud.msg.client.service.ISmsClient;
import com.opencloud.msg.client.model.SmsMessage;
import com.opencloud.msg.server.dispatcher.MessageDispatcher;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 推送通知
 *
 * @author woodev
 */
@RestController
@Api(value = "短信", tags = "短信")
public class SmsController implements ISmsClient {


    @Autowired
    private MessageDispatcher dispatcher;

    /**
     * 短信通知
     *smsMessage
     * @return
     */
    @ApiOperation(value = "发送短信", notes = "发送短信")
    @PostMapping("/sms")
    @Override
    public ResultBody<String> send(@RequestBody  SmsMessage smsMessage) {
        this.dispatcher.dispatch(smsMessage);
        return ResultBody.ok();
    }
}
