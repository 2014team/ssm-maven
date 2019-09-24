package com.ssm.maven.core.admin;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.maven.core.entity.Message;
import com.ssm.maven.core.entity.PageBean;
import com.ssm.maven.core.entity.User;
import com.ssm.maven.core.service.MessageService;
import com.ssm.maven.core.util.GsonUtil;
import com.ssm.maven.core.util.ResponseUtil;
import com.ssm.maven.core.util.StringUtil;

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
    * @param s_message
    * @param response
    * @return
    * @throws Exception
    */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page, @RequestParam(value = "rows", required = false) String rows, Message s_message, HttpServletResponse response) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if (page != null && rows != null) {
            PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
            paramMap.put("start", pageBean.getStart());
            paramMap.put("size",  pageBean.getPageSize());
        }
        
        paramMap.put("userName", s_message.getUserName());
        paramMap.put("mobile", s_message.getMobile());
        paramMap.put("demands", s_message.getDemands());
        
        int total = messageService.count(paramMap);
        List<Message> messageList = null;
        JSONObject result = new JSONObject();
        if(total > 0){
        	 messageList = messageService.select(paramMap);
             JSONArray jsonArray = JSONArray.fromObject(messageList);
             result.put("rows", jsonArray);
             result.put("total", total);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    
}
