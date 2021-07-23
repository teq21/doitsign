package poly.controller;

import org.apache.log4j.Logger;
//import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class MainController {
	
	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	// 인덱스 페이지로 가기위한 컨트롤러
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String Index2() {
		log.info(this.getClass());
		return "/index";
	}
	

	
	//맵 불러온느 컨트롤러
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String Index4() {
		log.info(this.getClass());
		return "/map/Map";
	
}
	
	// 테스트를 위한 컨트롤러
	
		@RequestMapping(value = "/test", method = RequestMethod.GET)
		public String Index7() {
			log.info(this.getClass());
			return "/test";
		
	}
	
	
}


