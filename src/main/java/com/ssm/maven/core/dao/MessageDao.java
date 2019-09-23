package com.ssm.maven.core.dao;

import org.springframework.stereotype.Repository;

import com.ssm.maven.core.entity.Message;

@Repository
public interface MessageDao extends BaseDao<Message, Integer> {

}