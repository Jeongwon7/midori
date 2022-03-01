package com.midori.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String zip_num;
	private String address1;
	private String address2;
	private String phone;
	private String email;
	private String useyn;
	private String indate;

	private List<Member_authVO> authList;
}
