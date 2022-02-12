package com.midori.mapper;

import com.midori.domain.MemberVO;

public interface MemberMapper {

	public int idCheck(String id);
	public void insert(MemberVO member);
	public int inset_auth(MemberVO member);
	
	
}
