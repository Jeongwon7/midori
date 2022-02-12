package com.midori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/mypage/*")//폴더 이름 review
@AllArgsConstructor
public class MypageController {
	
	@GetMapping("/orderdetail")
	public void orderdetailList() {
		
	}

}
