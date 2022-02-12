package com.midori.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.MemberVO;
import com.midori.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	
	@Override
	public void register(MemberVO member) {
		
		System.out.println("service : " + member.toString());
		
		mapper.insert(member);
		mapper.inset_auth(member);
	}
	

}
