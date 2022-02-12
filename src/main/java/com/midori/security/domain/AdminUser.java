package com.midori.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.midori.domain.MemberVO;

import lombok.Getter;

@Getter
public class AdminUser extends User{

   private static final long serialVersionUID = 1L;
   
   private MemberVO member;
   
   public AdminUser(String username, String password, Collection<? extends GrantedAuthority> authorites) {
      super(username, password, authorites); //user클래스를 상속하기 때문에 부모 클래스 생성자를 호출해야 함
   }
   
   public AdminUser(MemberVO vo) {
      super(vo.getId(), vo.getPwd(),
            vo.getAuthList()
            .stream()
            .map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
            .collect(Collectors.toList())
         );//Tbl_autoVO 인스턴스는 GrantedAuthority객체로 변환해야하므로 stream()와 amp()를 이용해서 처리
      this.member = vo;
   }
   
   
}