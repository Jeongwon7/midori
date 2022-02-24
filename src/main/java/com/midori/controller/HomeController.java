package com.midori.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.midori.domain.ProductVO;
import com.midori.mapper.MainMapper;
import com.midori.service.MainService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import oracle.net.ano.Service;

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
