package poly.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import poly.dto.StudyDTO;
import poly.service.impl.StudyService;
import poly.util.CmmUtil;
import poly.util.Pagination_other;

@Controller
public class StudyController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "StudyService")
	private StudyService studyService;
	
	@RequestMapping(value = "/study/studyForm")
	public String studyForm() {
		log.info(this.getClass().getName() + " studyForm start");

		return "/study/studyForm";
	}

	@RequestMapping(value = "/study/studyList")
	public String studyList(ModelMap model, HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1")int page) throws Exception {
		log.info(this.getClass().getName() + " studyList start");

		//페이징
		int listCnt = studyService.getStudyListCnt();
		Pagination_other pg = new Pagination_other(listCnt, page);
		model.addAttribute("pg", pg);
		
		int start = pg.getStartIndex() + 1;
		int end = pg.getStartIndex() + pg.getPageSize();
		
		List<StudyDTO> rList = studyService.getStudyList(start, end);

		if (rList == null) {
			rList = new ArrayList<>();
		}

		model.addAttribute("rList", rList);

		rList = null;

		log.info("studyList end");

		return "/study/studyList";
	}
	
	@PostMapping(value = "/study/doStudyForm")
	public String doStudyForm(HttpServletRequest request,HttpSession session, ModelMap model, MultipartHttpServletRequest  mf ) throws  Exception {
		log.info(this.getClass().getName() + " doStudyForm start123123");
		 MultipartFile mtf = mf.getFile("file");
		
     String reg_id=CmmUtil.nvl((String)session.getAttribute("user_name"));
		
		String file_path="/user_video/"+mtf.getOriginalFilename();
		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		
		
		StudyDTO pDTO = new StudyDTO();
		pDTO.setFile_path(file_path);
		pDTO.setReg_id(reg_id);
		pDTO.setPost_title(post_title);
		pDTO.setPost_content(post_content);
		
		int res = studyService.doStudyForm(pDTO);
		
		String msg;
		String url = "/study/studyList.do";
		
		if(res>0) {
			msg = "게시글 등록 성공";
		} else {
			msg = "게시글 등록 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/redirect";
	}
	@RequestMapping(value = "/study/studyDetail")
	public String studyDetail(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " studyDetail start");
		
		String post_no = request.getParameter("no");
		StudyDTO pDTO = new StudyDTO();
		pDTO.setPost_no(post_no);
		
		log.info("pDTO set 성공");
		
		StudyDTO rDTO = studyService.getStudyDetail(pDTO);
		
		log.info("rDTO 탑재 성공");
		
		if(rDTO==null) {
			model.addAttribute("msg", "존재하지 않는 게시물 입니다.");
			model.addAttribute("url", "/study/studyList.do");
			return "/redirect";
		}
		
		model.addAttribute("rDTO", rDTO);
		
		return "/study/studyDetail";
	}
	
	@RequestMapping(value = "/study/editStudyDetail")
	public String editStudyDetail(HttpServletRequest request, ModelMap model) {
		
		log.info(this.getClass().getName() + " editStudyDetail start");
		
		String post_no = request.getParameter("no");
		
		StudyDTO pDTO = new StudyDTO();
		pDTO.setPost_no(post_no);
		log.info("pDTO set 성공");
		
		StudyDTO rDTO = studyService.getStudyDetail(pDTO);
		log.info("rDTO 탑재 성공");
		log.info(rDTO.getFile_path());
		if(rDTO==null) {
			model.addAttribute("msg", "존재하지 않는 게시물 입니다.");
			model.addAttribute("url", "/study/studyList.do");
			return "/redirect";
		}
		
		model.addAttribute("rDTO", rDTO);
		
		return "/study/editStudyDetail";
		
	}
	
	@RequestMapping(value = "/study/doEditStudyDetail")
	public String doEditStudyDetail(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " doEditStudyDetail start");
		
		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		String post_no = request.getParameter("post_no");
		
		StudyDTO pDTO = new StudyDTO();
		
		log.info(post_title);
		log.info(post_content);
		log.info(post_no);
		
		pDTO.setPost_title(post_title);
		pDTO.setPost_content(post_content);
		pDTO.setPost_no(post_no);
		
		int res = studyService.updateStudyDetail(pDTO);
		
		String msg;
		String url = "/study/studyList.do";
		
		if(res>0) {
			
			msg = "게시글 수정에 성공 하였습니다.";
			
		} else {
			
			msg = "게시글 수정에 실패 하였습니다.";
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "/redirect";
	}
	
	@RequestMapping(value = "/study/doDeleteStudyDetail")
	public String doDelteStudyDetail(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " doDelteStudyDetail start");
		
		String post_no = request.getParameter("no");
		
		StudyDTO pDTO = new StudyDTO();
		
		pDTO.setPost_no(post_no);
		
		int res = studyService.deleteStudyDetail(pDTO);
		
		String msg;
		String url = "/study/studyList.do";
		
		if(res>0) {
			msg = "게시물 삭제에 성공 하였습니다.";
		} else {
			msg = "게시물 삭제에 실패 하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/redirect";
	}
	
	@RequestMapping(value = "/test")
	public String test() {
		log.info(this.getClass().getName() + " test");

		return "/test";
	}
	
}
