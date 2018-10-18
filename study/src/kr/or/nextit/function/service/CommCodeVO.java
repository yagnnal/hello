package kr.or.nextit.function.service;

import java.io.Serializable;

// VO객체 직렬화 시킬려고 Serializable
public class CommCodeVO implements Serializable {
	
	private String key;
	private String value;
	
	public CommCodeVO() {
		// 빈 인스턴스 생성
	}
	
	public CommCodeVO(String key, String value) {
		// 
		this.key = key;
		this.value = value;
	}
	
	// alt + shift + s
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
	
}
