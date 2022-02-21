package com.spring.web.vo;

public class UserVO {
	
	private String id;
    private String password;
    private String name;
    private String favoChar;
    
public UserVO() {
}

public UserVO(String id, String password, String name, String favoChar) {
	super();
	this.id = id;
	this.password = password;
	this.name = name;
	this.favoChar = favoChar;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getFavoChar() {
	return favoChar;
}

public void setFavoChar(String favoChar) {
	this.favoChar = favoChar;
}

@Override
public String toString() {
	return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", favoChar=" + favoChar + "]";
}
    

}
