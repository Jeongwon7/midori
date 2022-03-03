package com.midori.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/summer/*")
@Log4j
public class SummerController {
	
		  @PostMapping(value="/Image.do", produces = "application/json; charset=utf8")
	      public @ResponseBody String profileImagedo(@RequestParam("file") MultipartFile file) {
	      
	      JsonObject jsonObject = new JsonObject();
	      
	      String uploadFolder="c:\\upload";
	      log.info("file name : "+file.getOriginalFilename());
	      
	      String uploadFileName = file.getOriginalFilename();
	      //IE
	      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//")+1);
	      log.info("only file name : "+uploadFileName);
	      
	      UUID uuid = UUID.randomUUID();
	      
	      uploadFileName = uuid.toString()+"_"+uploadFileName;
	      
	      File uploadPath = new File(uploadFolder, getFolder());
	      
	      if(uploadPath.exists() == false) {
	         uploadPath.mkdirs();
	      }
	      File savefile = new File(uploadPath,uploadFileName);
	      String saveUrl = uploadFileName.toString();
	      log.info(saveUrl);
	      
	      try {
	         file.transferTo(savefile);
	         uploadFileName = (savefile.toString().substring(10));
	         jsonObject.addProperty("url", "/upload/"+uploadFileName);
	         jsonObject.addProperty("responseCode", "success");
	         log.info(uploadFileName);

	      }catch(Exception e) {
	         e.printStackTrace();
	         jsonObject.addProperty("responseCode", "error");
	      }
	      
	      String upload = jsonObject.toString();
	      log.info(upload);
	      return upload;
	   }
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);//-를 기준으로 분리 된다
	}
}
