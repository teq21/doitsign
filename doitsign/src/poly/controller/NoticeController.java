package poly.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import poly.dto.NoticeDTO;
import poly.service.INoticeService;
import poly.service.impl.NoticeService;
import poly.util.CmmUtil;
import poly.util.Pagination_other;

@Controller
public class NoticeController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private NoticeService noticeService;

	@RequestMapping(value = "/notice/noticeList")
	public String noticeList(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(defaultValue = "1") int page) throws Exception {
		log.info(this.getClass().getName() + " noticeList start");

		// 페이징
		int listCnt = noticeService.getNoticeListCnt();
		Pagination_other pg = new Pagination_other(listCnt, page);
		model.addAttribute("pg", pg);

		int start = pg.getStartIndex() + 1;
		int end = pg.getStartIndex() + pg.getPageSize();

		List<NoticeDTO> rList = noticeService.getNoticeList(start, end);

		if (rList == null) {
			rList = new ArrayList<NoticeDTO>();
		}

		model.addAttribute("rList", rList);

		rList = null;

		log.info("noticeList end");

		return "/notice/noticeList";
	}

	@RequestMapping(value = "/notice/noticeForm")
	public String noticeForm(HttpServletRequest request, HttpSession session, RedirectAttributes redirect,
			ModelMap model) {
		log.info(this.getClass().getName() + " noticeForm start");
		String user_name = (String) session.getAttribute("user_name");
		if (!user_name.equals("admin")) {

			String msg = "It's not appropriate approach. You are not an administer.";
			String url = "/index.do";

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "/redirect";
		}

		return "/notice/noticeForm";
	}

	@RequestMapping(value = "/notice/doNoticeForm")
	public String doNoticeForm(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " doNoticeForm start");

		String reg_id = "admin";

		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		// String reg_dt = request.getParameter("reg_dt");

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setReg_id(reg_id);
		pDTO.setPost_title(post_title);
		pDTO.setPost_content(post_content);
		// pDTO.setReg_dt(reg_dt);

		// log.info(reg_dt);

		int res = noticeService.doNoticeForm(pDTO);

		String msg;
		String url = "/notice/noticeList.do";

		if (res > 0) {
			msg = "寃뚯떆湲� �벑濡� �꽦怨�";
		} else {
			msg = "寃뚯떆湲� �벑濡� �떎�뙣";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/redirect";
	}

	@RequestMapping(value = "/dummyPage")
	public String dummyPage() {
		log.info(this.getClass().getName() + " dummyPage start");

		return "/dummyPage";
	}

	@RequestMapping(value = "/notice/noticeDetail")
	public String noticeDetail(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " noticeDetail start");

		String post_no = request.getParameter("no");

		NoticeDTO pDTO = new NoticeDTO();
		pDTO.setPost_no(post_no);
		log.info("pDTO set �꽦怨�");

		NoticeDTO rDTO = noticeService.getNoticeDetail(pDTO);

		log.info("rDTO �깙�옱 �꽦怨�");

		if (rDTO == null) {
			model.addAttribute("msg", "議댁옱�븯吏� �븡�뒗 寃뚯떆臾� �엯�땲�떎.");
			model.addAttribute("url", "/notice/noticeList.do");
			return "/redirect";
		}

		model.addAttribute("rDTO", rDTO);

		return "/notice/noticeDetail";
	}

	@RequestMapping(value = "/notice/editNoticeDetail")
	public String editNoticeDetail(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " editNoticeDetail start");

		String no = request.getParameter("no");
		String post_title = request.getParameter("title");
		String post_content = request.getParameter("content");

		NoticeDTO pDTO = new NoticeDTO();
		pDTO.setPost_no(no);
		pDTO.setPost_title(post_title);
		pDTO.setPost_content(post_content);

		log.info("pDTO post_title �깙�옱 : " + post_title);
		log.info("pDTO post_content �깙�옱 : " + post_content);

		NoticeDTO rDTO = noticeService.getNoticeDetail(pDTO);

		if (rDTO == null) {
			model.addAttribute("msg", "議댁옱�븯吏� �븡�뒗 寃뚯떆臾� �엯�땲�떎.");
			model.addAttribute("url", "/notice/noticeList.do");
			return "/redirect";
		}

		model.addAttribute("rDTO", rDTO);

		log.info(post_content);

		return "/notice/editNoticeDetail";
	}

	@RequestMapping(value = "/notice/doEditNoticeDetail")
	public String doEditNoticeDetail(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " doEditNoticeDetail start");

		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setPost_title(post_title);
		pDTO.setPost_content(post_content);

		log.info(post_title);
		log.info(post_content);
		log.info("濡쒓렇 �솗�씤�슜");

		int res = noticeService.updateNotice(pDTO);

		String msg;
		String url = "/notice/noticeList.do";

		if (res > 0) {

			msg = "怨듭��궗�빆 �닔�젙�뿉 �꽦怨� �븯���뒿�땲�떎.";

		} else {

			msg = "怨듭��궗�빆 �닔�젙�뿉 �떎�뙣 �븯���뒿�땲�떎.";

		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/redirect";
	}

	@RequestMapping(value = "/notice/doDeleteNotice")
	public String doDeleteNotice(HttpServletRequest request, ModelMap model) {
		log.info(this.getClass().getName() + " doDeleteNotice start");

		String post_no = request.getParameter("no");

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setPost_no(post_no);

		int res = noticeService.doDeleteNotice(pDTO);

		String msg;
		String url = "/notice/noticeList.do";

		if (res > 0) {
			msg = "삭제되었습니다";
		} else {
			msg = "삭제되었습니다";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/redirect";
	}

}
