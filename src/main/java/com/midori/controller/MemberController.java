package com.midori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midori.domain.MemberVO;
import com.midori.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@GetMapping("/join.do")
	public void memberView() {

	}

	@GetMapping("/checkUserid.do")
	public @ResponseBody int checkUserId(@RequestParam("id") String id) { // @ResponseBody JSON �삎�떇�쑝濡� 由ы꽩 �맂�떎
		int result = service.idCheck(id);
		log.info("result : " + result);
		return result;
	}

	@PostMapping("/memberinsertpro.do")
	public String memberInsert(MemberVO member) {

		System.out.println(member.getId());
		System.out.println(member.getPwd());

		member.setPwd(pwencoder.encode(member.getPwd()));

		service.register(member);

		return "redirect:/";
	}

	@GetMapping("/login.do")
	public void customLogin() {

	}
	
}
