package qcg.bean;

import java.io.Serializable;

/**
 * @Author: qcg
 * @Description:
 * @Date: 2018/12/25 13:08
 */
public class User implements Serializable {
	private String id;
	private String username;
	private String password;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
