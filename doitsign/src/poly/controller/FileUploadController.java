package poly.controller;
import java.io.File;
import java.util.Iterator;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import poly.dto.StudyDTO;
import poly.service.impl.StudyService;
 
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class FileUploadController {
	@Resource(name = "StudyService")
	private StudyService studyService;
	private Logger log = Logger.getLogger(this.getClass());
   

    
    @RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest) {//Multipart로 받는다.
    	
         log.info("파일얿로드 탐");
        Iterator<String> itr =  multipartRequest.getFileNames();
        
        String filePath = "/WebContent/user_video"; //설정파일로 뺀다.
                           
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
            
            MultipartFile mpf = multipartRequest.getFile(itr.next());
                                           
            String originalFilename = mpf.getOriginalFilename(); //파일명
            
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
            
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
     
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
              
       }
        
        
        return "success";
    }
    
}
