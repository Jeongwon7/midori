package com.midori.service;

import com.midori.domain.MemberVO;

public interface MemberService {

	public int idCheck(String id);
	public void register(MemberVO member);
}
