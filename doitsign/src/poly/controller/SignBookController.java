package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dto.SignBookDTO;
import poly.service.ISignBookService;
import poly.util.Pagination;

@Controller
public class SignBookController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "SignBookService")
	private ISignBookService SignBookService;
	
	@RequestMapping(value = "/signBook/signBookList")
	public String signBookList(ModelMap model, HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1")int page) throws Exception {
		log.info(this.getClass().getName() + " signBookList start");
		
		//페이징 로직
		int listCnt = SignBookService.getSignBookListCnt();
		Pagination pg = new Pagination(listCnt, page);
		model.addAttribute("pg", pg);
		
		int start = pg.getStartIndex() + 1;
		int end = pg.getStartIndex() + pg.getPageSize();
		
		log.info(start);
		log.info(end);
		
		//리스트 불러오기 로직
		List<SignBookDTO> rList= SignBookService.getSignBookList(start, end);
		
		if (rList == null) {
			rList = new ArrayList<SignBookDTO>();
		}
		
		model.addAttribute("rList", rList);

		rList = null;

		log.info("signBookList end");

		return "/signBook/signBookList";
	}
	
	//영어사전 가져오는 컨틀롤러
		@RequestMapping(value = "/EsignBookList", method = RequestMethod.GET)
		public String Index3() {
			log.info(this.getClass());
			return "/signBook/EsignBookList";

		}
		
}
