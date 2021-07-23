package poly.service;

import java.util.List;

import poly.dto.StudyDTO;

public interface IStudyService {

	List<StudyDTO> getStudyList(int start, int end) throws Exception;
	
	int doStudyForm(StudyDTO pDTO);
	
	StudyDTO getStudyDetail(StudyDTO pDTO);
	
	int updateStudyDetail(StudyDTO pDTO);
	
	int deleteStudyDetail(StudyDTO pDTO);
	
	int getStudyListCnt() throws Exception;


	

}
