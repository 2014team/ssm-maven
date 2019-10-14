
package com.ssm.maven.core.entity;

import java.io.Serializable;
import java.util.Date;

public class BaseBean implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	public Integer id;

	/**
	 * 创建时间
	 */
	private Date createDate;

	/**
	 * 更新时间
	 */
	private Date updateDate;

	/**
	 * 查找名称
	 */
	private String searchName;

	/**
	 * 查询值
	 */
	private String searchValue;

	public Integer getId() {

		return id;
	}

	public void setId(Integer id) {

		this.id = id;
	}

	public Date getCreateDate() {

		return createDate;
	}

	public void setCreateDate(Date createDate) {

		this.createDate = createDate;
	}

	public Date getUpdateDate() {

		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {

		this.updateDate = updateDate;
	}

	public String getSearchName() {

		return searchName;
	}

	public void setSearchName(String searchName) {

		this.searchName = searchName;
	}

	public String getSearchValue() {

		return searchValue;
	}

	public void setSearchValue(String searchValue) {

		this.searchValue = searchValue;
	}

}
