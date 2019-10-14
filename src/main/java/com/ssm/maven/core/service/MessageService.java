package com.ssm.maven.core.service;

import java.util.Map;

import com.ssm.maven.core.entity.Message;

public interface MessageService extends BaseService<Message, Integer> {
	
	/**
	* @Title: searchParamHandler
	* @Description: 查找参数处理
	* @param paramMap
	* @param message
	*/
	public void searchParamHandler(Map<String, Object> paramMap,Message message);
	
	

}
