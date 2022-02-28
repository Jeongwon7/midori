package com.midori.controller;

import java.security.Principal;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@Autowired
    private JavaMailSender mailSender;
	
	//회원가입페이지
	@GetMapping("/join.do")
	public void memberView() {
		
	}
	
	//회원가입완료
	@PostMapping("/memberinsertpro.do")
	public String memberInsert(MemberVO member) {
		System.out.println(member.getId());
		System.out.println(member.getPwd());
		member.setPwd(pwencoder.encode(member.getPwd()));
		service.register(member);
		return "redirect:/";
	}
	
	//로그인 페이지
	@GetMapping("/login.do")
	public void customLogin() {
		
	}
	
	//아이디 체크
	@ResponseBody
	@GetMapping("/checkUserid.do")
	public  int checkUserId(@RequestParam("id") String id) { 
		int result = service.idCheck(id);
		log.info("result : " + result);
		
		return result;
	}
	
	//이메일전송페이지
	@GetMapping("/email.do")
	public void emailSend() {
		
	}
	
	//이메일인증 보내기
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{

        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("이메일 : " + email);
               
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "baozi3785@naver.com";
        String toMail = email;
        log.info("이메일 : " + email);
        String title = "녹색식탁 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        	try {
        	log.info("이메일 : " + email);
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        log.info("checkNum : " + checkNum);
        
        return num;
    }
    
	//회원수정페이지
	@GetMapping("/memberModify.do")
	public void memberUdatepage(Principal principal, Model model) {
		
		String id = principal.getName();
		
		System.out.println(service.selectOneMember(id));
		service.selectOneMember(id);
		
		model.addAttribute("view", service.selectOneMember(id));
		
	}
	
	//회원수정완료
	@PostMapping("/memberModify.do")
	public String registerUpdate(MemberVO mvo, RedirectAttributes rttr) {
		System.out.println("mvo: "+mvo);
		
		if(mvo.getPwd() == "") {
			service.memberUpdateN(mvo);
		}else {
			mvo.setPwd(pwencoder.encode(mvo.getPwd()));
			service.memberUpdate(mvo);
		}
		System.out.println("성공");
		return "redirect:/";
	}
	
	//회원삭제완료
	@GetMapping("/memberDelete.do")
	public String memberDelete(Principal principal, RedirectAttributes rttr) {
		String id = principal.getName();
		log.info("id: "+id);
		service.memberDelete(id);
		
		return "redirect:/";
	}
	
}