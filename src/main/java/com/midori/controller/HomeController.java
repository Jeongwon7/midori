package com.midori.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.midori.domain.Criteria9;
import com.midori.domain.PageVO9;
import com.midori.domain.ProductVO;
import com.midori.service.MainService;
import com.midori.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private MainService service;
	
	@Setter(onMethod_ = @Autowired)
	private ProductService pservice;


	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,Criteria9 cri9) {
		List<ProductVO> newlist = service.GetNewPro();
		List<ProductVO> bestlist = service.GetBestPro();
		List<ProductVO> slist = service.GetSalad();
		List<ProductVO> dlist = service.getDessert();
		List<ProductVO> flist = service.GetFriedrice();
		List<ProductVO> clist = service.GetChicken();
		model.addAttribute("newlist", newlist); 
		model.addAttribute("bestlist", bestlist);
		model.addAttribute("slist", slist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("flist", flist);
		model.addAttribute("clist", clist);
		 List<ProductVO> list = pservice.getProductListWithPaging(cri9);
			//	  System.out.println("list: "+list);
			      model.addAttribute("list", list);
			      int total = pservice.getTotalCount(cri9);  
			      model.addAttribute("pageMaker", new PageVO9(cri9, total));
			      return "index1";
	}
}
