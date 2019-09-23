
package com.ssm.maven.core.entity;

public class Message extends BaseBean {

	private static final long serialVersionUID = 1L;

	//姓名
	private String userName;

	//手机号码
	private String mobile;

	//咨询项目
	private String demands;

	public String getUserName() {

		return userName;
	}

	public void setUserName(String userName) {

		this.userName = userName;
	}

	public String getMobile() {

		return mobile;
	}

	public void setMobile(String mobile) {

		this.mobile = mobile;
	}

	public String getDemands() {

		return demands;
	}

	public void setDemands(String demands) {

		this.demands = demands;
	}

}
