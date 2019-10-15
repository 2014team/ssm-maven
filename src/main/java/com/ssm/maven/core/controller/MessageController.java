package com.ssm.maven.core.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.maven.core.entity.Message;
import com.ssm.maven.core.entity.PageBean;
import com.ssm.maven.core.service.MessageService;
import com.ssm.maven.core.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/message")
public class MessageController {

    @Resource
    private MessageService messageService;
    private static final Logger log = Logger.getLogger(MessageController.class);// 日志文件
  
    /**
    * @Title: list
    * @Description: 留言列表
    * @param page
    * @param rows
    * @param message
    * @param response
    * @return
    * @throws Exception
    */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page, 
                       @RequestParam(value = "rows", required = false) String rows, 
                       Message message,
                       HttpServletResponse response) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if (page != null && rows != null) {
            PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
            paramMap.put("start", pageBean.getStart());
            paramMap.put("size",  pageBean.getPageSize());
        }
        log.info("message : "+message.toString());
        // 查找参数处理
        messageService.searchParamHandler(paramMap, message);
        
        int total = messageService.count(paramMap);
        List<Message> messageList = null;
        JSONObject result = new JSONObject();
        JSONArray jsonArray = null;
        if(total > 0){
        	 messageList = messageService.select(paramMap);
             jsonArray = JSONArray.fromObject(messageList);
        }
        result.put("rows", (jsonArray == null)? "":jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }
    
    /**
    * @Title: delete
    * @Description: 删除
    * @param ids
    * @param response
    * @return
    * @throws Exception
    */
    @RequestMapping("/del")
    public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
        	messageService.delete(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        log.info("ids: " + ids);
        ResponseUtil.write(response, result);
        return null;
    }
    
    
}
