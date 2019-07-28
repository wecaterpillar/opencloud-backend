package com.opencloud.task.server.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.opencloud.common.model.PageParams;
import com.opencloud.task.client.model.entity.TaskJobLogs;

/**
 * 异步通知日志接口
 *
 * @author: liuyadu
 * @date: 2019/2/13 14:39
 * @description:
 */
public interface TaskJobLogsService {
    /**
     * 分页查询
     *
     * @param pageParams
     * @return
     */
    IPage<TaskJobLogs> findListPage(PageParams pageParams);

    /**
     * 添加日志
     *
     * @param log
     */
    void addLog(TaskJobLogs log);

    /**
     * 更细日志
     *
     * @param log
     */
    void modifyLog(TaskJobLogs log);


    /**
     * 根据主键获取日志
     *
     * @param logId
     * @return
     */
    TaskJobLogs getLog(String logId);
}
