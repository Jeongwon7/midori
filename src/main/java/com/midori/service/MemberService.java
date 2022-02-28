package com.midori.service;

import com.midori.domain.MemberVO;

public interface MemberService {

	//아이디 체크
	public int idCheck(String id);
	//회원가입
	public void register(MemberVO member);
	//회원 1명 검색
	public MemberVO selectOneMember(String id);
	//회원수정(비밀번호 변경O)
	public void memberUpdate(MemberVO mvo);
	//회원수정(비밀번호 변경X)
	public void memberUpdateN(MemberVO mvo);
	//회원탈퇴
	public void memberDelete(String id);
}
