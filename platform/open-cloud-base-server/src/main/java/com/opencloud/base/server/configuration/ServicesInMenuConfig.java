package com.opencloud.base.server.configuration;

import com.alibaba.fastjson.JSONObject;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Configuration
@ConfigurationProperties(prefix = "openea-menus.services")
public class ServicesInMenuConfig extends Properties {

    public List<JSONObject> toJsonList(){
        List<JSONObject> jsonList = new ArrayList<JSONObject>();
        for(Object key: this.keySet()){
            JSONObject json = new JSONObject();
            json.put("serviceId", (String)key);
            json.put("serviceName", getProperty((String)key)+" ("+key+")");
            jsonList.add(json);
        }
        return jsonList;
    }
}
