package com.opencloud.base.provider.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.opencloud.base.client.model.UserAccount;
import com.opencloud.base.client.model.entity.BaseRole;
import com.opencloud.base.client.model.entity.BaseDeveloper;
import com.opencloud.base.client.service.IBaseDeveloperServiceClient;
import com.opencloud.base.provider.service.BaseDeveloperService;
import com.opencloud.common.model.PageParams;
import com.opencloud.common.model.ResultBody;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 系统用户信息
 *
 * @author liuyadu
 */
@Api(tags = "系统用户管理")
@RestController
public class BaseDeveloperController implements IBaseDeveloperServiceClient {
    @Autowired
    private BaseDeveloperService baseDeveloperService;



    /**
     * 获取登录账号信息
     *
     * @param username 登录名
     * @return
     */
    @ApiOperation(value = "获取账号登录信息", notes = "仅限系统内部调用")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", required = true, value = "登录名", paramType = "path"),
    })
    @PostMapping("/developer/login")
    @Override
    public ResultBody<UserAccount> developerLogin(@RequestParam(value = "username") String username) {
        UserAccount account = baseDeveloperService.login(username);
        return ResultBody.ok().data(account);
    }

    /**
     * 系统分页用户列表
     *
     * @return
     */
    @ApiOperation(value = "系统分页用户列表", notes = "系统分页用户列表")
    @GetMapping("/developer")
    public ResultBody<IPage<BaseDeveloper>> getUserList(@RequestParam(required = false) Map map) {
        return ResultBody.ok().data(baseDeveloperService.findListPage(new PageParams(map)));
    }

    /**
     * 获取所有用户列表
     *
     * @return
     */
    @ApiOperation(value = "获取所有用户列表", notes = "获取所有用户列表")
    @GetMapping("/developer/all")
    public ResultBody<List<BaseRole>> getUserAllList() {
        return ResultBody.ok().data(baseDeveloperService.findAllList());
    }

    /**
     * 添加系统用户
     *
     * @param developerName
     * @param password
     * @param nickName
     * @param status
     * @param developerType
     * @param email
     * @param mobile
     * @param developerDesc
     * @param avatar
     * @return
     */
    @ApiOperation(value = "添加系统用户", notes = "添加系统用户")
    @PostMapping("/developer/add")
    public ResultBody<Long> addUser(
            @RequestParam(value = "developerName") String developerName,
            @RequestParam(value = "password") String password,
            @RequestParam(value = "nickName") String nickName,
            @RequestParam(value = "status") Integer status,
            @RequestParam(value = "developerType") String developerType,
            @RequestParam(value = "email", required = false) String email,
            @RequestParam(value = "mobile", required = false) String mobile,
            @RequestParam(value = "developerDesc", required = false) String developerDesc,
            @RequestParam(value = "avatar", required = false) String avatar
    ) {
        BaseDeveloper developer = new BaseDeveloper();
        developer.setUserName(developerName);
        developer.setPassword(password);
        developer.setNickName(nickName);
        developer.setUserType(developerType);
        developer.setEmail(email);
        developer.setMobile(mobile);
        developer.setUserDesc(developerDesc);
        developer.setAvatar(avatar);
        baseDeveloperService.addUser(developer, status);
        return ResultBody.ok();
    }

    /**
     * 更新系统用户
     *
     * @param developerId
     * @param nickName
     * @param status
     * @param developerType
     * @param email
     * @param mobile
     * @param developerDesc
     * @param avatar
     * @return
     */
    @ApiOperation(value = "更新系统用户", notes = "更新系统用户")
    @PostMapping("/developer/update")
    public ResultBody updateUser(
            @RequestParam(value = "developerId") Long developerId,
            @RequestParam(value = "nickName") String nickName,
            @RequestParam(value = "status") Integer status,
            @RequestParam(value = "developerType") String developerType,
            @RequestParam(value = "email", required = false) String email,
            @RequestParam(value = "mobile", required = false) String mobile,
            @RequestParam(value = "developerDesc", required = false) String developerDesc,
            @RequestParam(value = "avatar", required = false) String avatar
    ) {
        BaseDeveloper developer = new BaseDeveloper();
        developer.setUserId(developerId);
        developer.setNickName(nickName);
        developer.setUserType(developerType);
        developer.setEmail(email);
        developer.setMobile(mobile);
        developer.setUserDesc(developerDesc);
        developer.setAvatar(avatar);
        baseDeveloperService.updateUser(developer, status);
        return ResultBody.ok();
    }


    /**
     * 修改用户密码
     *
     * @param developerId
     * @param password
     * @return
     */
    @ApiOperation(value = "修改用户密码", notes = "修改用户密码")
    @PostMapping("/developer/update/password")
    public ResultBody updatePassword(
            @RequestParam(value = "developerId") Long developerId,
            @RequestParam(value = "password") String password
    ) {
        baseDeveloperService.updatePassword(developerId, password);
        return ResultBody.ok();
    }


    /**
     * 注册第三方系统登录账号
     *
     * @param account
     * @param password
     * @param accountType
     * @return
     */
    @ApiOperation(value = "注册第三方系统登录账号", notes = "仅限系统内部调用")
    @PostMapping("/developer/add/thirdParty")
    @Override
    public ResultBody addDeveloperThirdParty(
            @RequestParam(value = "account") String account,
            @RequestParam(value = "password") String password,
            @RequestParam(value = "accountType") String accountType,
            @RequestParam(value = "nickName") String nickName,
            @RequestParam(value = "avatar") String avatar
    ) {
        BaseDeveloper developer = new BaseDeveloper();
        developer.setNickName(nickName);
        developer.setUserName(account);
        developer.setPassword(password);
        developer.setAvatar(avatar);
        baseDeveloperService.addUserThirdParty(developer, accountType);
        return ResultBody.ok();
    }

}
