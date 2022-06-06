package kr.co.jisu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.jisu.common.PageMaker;
import kr.co.jisu.common.SearchCriteria;
import kr.co.jisu.domain.BoardDTO;
import kr.co.jisu.service.BoardService;
import kr.co.jisu.domain.ReplyDTO;

@Controller
@RequestMapping("/board/")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;
	
	// 전체보기
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.countPaging(cri));
		
		model.addAttribute("list", boardService.listSearch(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		return "list";		
	}
	
	// 글읽기
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(int bno, BoardDTO dto) {
		logger.info("글읽기");
		ModelAndView mav = new ModelAndView();
		dto = boardService.detail(bno);

		mav.addObject("board", dto); // view로 보낼 데이터 값 (변수명, 데이터)

		List<ReplyDTO> replyList = boardService.replyList(bno);
		mav.addObject("list", replyList);

		mav.setViewName("detail");
		return mav;
	}

	// 글쓰기 폼
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public ModelAndView register() {
		logger.info("글쓰기폼");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("regist");
		return mav;
	}

	// 글쓰기
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ModelAndView register(BoardDTO dto, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");

		logger.info("글쓰기");
		boardService.regist(dto);
		rttr.addFlashAttribute("msg", "regist");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:list");
		return mav;
	}

	// 글수정폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(@RequestParam("bno") int bno, BoardDTO dto, Model model) {
		logger.info("글수정폼");
		dto = boardService.detail(bno);
		model.addAttribute("board", dto);
		return "update";
	}

	// 글수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(BoardDTO dto, RedirectAttributes rttr) throws Exception {
		logger.info("글수정");
		ModelAndView mav = new ModelAndView();
		boardService.update(dto);
		rttr.addFlashAttribute("msg", "update");
		mav.setViewName("redirect:list");
		return mav;
	}

	// 글삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public ModelAndView delete(int bno, HttpServletRequest request, HttpServletResponse response
			,RedirectAttributes rttr) {
		logger.info("글삭제");
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		ModelAndView mav = new ModelAndView();
		boardService.delete(bno);
		logger.info("bno" + bno);
		rttr.addFlashAttribute("msg", "delete");
		mav.setViewName("redirect:list");
		return mav;
	}


	// ajax댓글에 대한 매핑과 메소드를 구현
	// "boardReplyList" 매핑설정
	// json 처리를 위한 라이브러리 필요 = jackson-databind, jackson=core
	// @ResponseBody 설정
	@ResponseBody
	@RequestMapping(value = "replyList", method = RequestMethod.POST)
	public List<ReplyDTO> replyList(@RequestParam("bno") int bno) {

		return boardService.replyList(bno);
	}

	// ajax 댓글 board/reply2
	@ResponseBody
	@RequestMapping(value = "replyRegist", method = RequestMethod.POST)
	public int replyRegist(ReplyDTO dto) {

		return boardService.replyRegist(dto);
	}

	// ajax 수정 구현
	@ResponseBody
	@RequestMapping(value = "replyUpdate", method = RequestMethod.POST)
	public Map<String, Object> replyupdate2(ReplyDTO dto) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			boardService.replyUpdate(dto);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "Fail");
		}

		return result;
	}
	
	//ajax 삭제 구현\
	@ResponseBody
	@RequestMapping(value = "replyDelete", method = RequestMethod.POST)
	public Map<String, Object> replydelete2(int reno){
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			boardService.replyDelete(reno);
			result.put("status", "success");
			
		}catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		
		return result;
	}

	

}