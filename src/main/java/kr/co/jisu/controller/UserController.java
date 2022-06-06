/*
 * 
 */
package kr.co.jisu.controller;


import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.jisu.domain.UserDTO;
import kr.co.jisu.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
		@Inject
		private UserService userService;
	
    	// 로그인 폼
		@RequestMapping(value = "/user/login", method = RequestMethod.GET)
		public String login() {
			logger.info("로그인폼으로 이동");
			return "login";
		}
		
		//
		@SuppressWarnings("rawtypes")
		@RequestMapping(value = "/user/login", method = RequestMethod.POST)
		public String login(@RequestParam Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
				HttpSession session, RedirectAttributes rttr) throws Exception {
			request.setCharacterEncoding("utf-8");
			logger.info("DB 로그인 확인");
			Map user = userService.login(map);

			if (user == null) { // 로그인 실패
				logger.info("로그인 안됨");
				rttr.addFlashAttribute("msg", "loginFail");
				return "redirect:login";
			} else { // 로그인 성공
				// 세션 부여
				session.setAttribute("user", user);
				return "redirect:/";
			}
		}
		
		
		@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			logger.info("로그아웃");
			session.invalidate();
			return "redirect:/";
		}
		
		//회원가입 폼
		@RequestMapping(value = "/user/join", method = RequestMethod.GET)
		public ModelAndView join() {
			logger.info("회원가입 폼");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("join");
			return mav;
		}
		@RequestMapping(value = "/user/join", method = RequestMethod.POST)
		public ModelAndView join(UserDTO dto, HttpServletResponse response
				, RedirectAttributes rttr, @RequestParam("id") String id) throws Exception {
			
			response.setHeader("Content-Type", "text/html;charset=utf-8");
			int result = userService.checkId(dto);
			ModelAndView mav = new ModelAndView();
			try {
				if(result == 0) {
					logger.info("회원가입");
					String name = dto.getId();
					userService.join(dto);
					rttr.addFlashAttribute("name", name);
					rttr.addFlashAttribute("msg", "join");
					mav.setViewName("redirect:/#");
					return mav;	
				}else {
					logger.info("id중복");
					rttr.addFlashAttribute("msg", "duplicate");
					mav.setViewName("redirect:join");
					return mav;
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			return mav;
		}

	
	
	
	
//	@RequestMapping(value="login/loginForm", method= RequestMethod.GET)
//	public ModelAndView loginForm() {
//		logger.info("로그인폼으로 이동");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("login/loginForm");
//		return mav;		
//	}
//	
//	@RequestMapping(value = "login/userlogin")
//	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
//			LoginDTO dto, Session session) {
//		ModelAndView mav = new ModelAndView();
//		
//		
//		
//		return mav;
//	}
//
//	@RequestMapping(value="login/login", method= RequestMethod.POST)
//	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws Exception {
//		logger.info("로그인 결과로 이동");
//		request.setCharacterEncoding("utf-8");
//		// 데이터 전송받기
//		String userID = request.getParameter("userID");
//		String name = request.getParameter("name");
//		// 데이터를 service(DAO) 로 보내서 결과받기 - DB있을때 	
//		
//		//결과 전송
//		ModelAndView mav = new ModelAndView();		
//		mav.addObject("userID", userID);
//		mav.addObject("name", name);
//		mav.setViewName("login/result");
//		return mav;		
//	}
//	
////	requst한 파라미터를 전달받는 방법2
//	@RequestMapping(value="login/login2", method= RequestMethod.POST)
//	public ModelAndView login2(@RequestParam("userID") String userID,
//			@RequestParam("name") String name,
//			HttpServletRequest request,HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		
//		//결과 전송
//		ModelAndView mav = new ModelAndView();		
//		mav.addObject("userID", userID);
//		mav.addObject("name", name);
//		mav.setViewName("login/result");
//		return mav;	
//	}
////	requst한 파라미터를 전달받는 방법3 
////	@RequestParam Map<> info
//	@RequestMapping(value="login/login3", method = RequestMethod.POST)
//	public ModelAndView login3(@RequestParam Map<String,Object> info,
//			HttpServletRequest request) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		logger.info("아이디 : " + info.get("userID"));
//		logger.info("이름 : " + info.get("name"));
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("info", info);
//		mav.setViewName("login/result");
//		return mav;
//	}
//	
//	@RequestMapping(value="login/login4",  method = RequestMethod.POST)
////	public ModelAndView login4(LoginVO loginVo,	HttpServletRequest request) throws Exception{
//	public ModelAndView login4(@ModelAttribute("info") LoginDTO loginVo,	HttpServletRequest request) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		
//		ModelAndView mav = new ModelAndView();		
////		mav.addObject("info", loginVo);
//		mav.setViewName("login/result");
//		return mav;
//		
//	}
	
	
	
	
}









