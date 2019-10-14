package com.ssm.maven.core.service.impl;

import java.lang.reflect.Field;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ssm.maven.core.entity.Message;
import com.ssm.maven.core.service.MessageService;

@Service
public class MessageImpl extends BaseServiceImpl< Message, Integer> implements  MessageService{

	/**
	* @Title: searchParamHandler
	* @Description: 查找参数处理
	* @param paramMap
	* @param message
	*/
	@Override
	public void searchParamHandler(Map<String, Object> paramMap, Message message) {
		String searchName = message.getSearchName();
		String searchValue = message.getSearchValue();
		if(StringUtils.isNotBlank(searchName) && StringUtils.isNotBlank(searchValue) ){
			// 获取类字段
			Field[] fieldArr = Message.class.getDeclaredFields();
			for (Field field : fieldArr) {
				String fieldName = field.getName();
				if(searchName.equals(fieldName)){
					paramMap.put(fieldName, searchValue);
				}
			}
		}
	}
		
}
