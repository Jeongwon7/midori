package com.midori.controller;

import java.util.List;
import java.util.Locale;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.midori.domain.ProductVO;
import com.midori.service.MainService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private MainService service;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<ProductVO> newlist = service.GetNewPro();
		List<ProductVO> bestlist = service.GetBestPro();
		model.addAttribute("newlist", newlist);
		model.addAttribute("bestlist", bestlist);
		return "index";
	}
	
}
