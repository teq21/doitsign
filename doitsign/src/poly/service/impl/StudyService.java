package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import poly.dto.StudyDTO;
import poly.persistance.mapper.IStudyMapper;
import poly.service.IStudyService;

@Service("StudyService")
public class StudyService implements IStudyService {

	@Resource(name = "StudyMapper")
	IStudyMapper studyMapper;

	@Override
	public List<StudyDTO> getStudyList(int start, int end) throws Exception {
		
		return studyMapper.getStudyList(start, end);
	}

	@Override
	public int doStudyForm(StudyDTO pDTO) {
		
		return studyMapper.doStudyForm(pDTO);
	}
	
	@Override
	public StudyDTO getStudyDetail(StudyDTO pDTO) {
		
		return studyMapper.getStudyDetail(pDTO);
	}


	@Override
	public int updateStudyDetail(StudyDTO pDTO) {
		
		return studyMapper.updateStudyDetail(pDTO);
	}


	@Override
	public int deleteStudyDetail(StudyDTO pDTO) {
		
		return studyMapper.deleteStudyDetail(pDTO);
	}


	@Override
	public int getStudyListCnt() throws Exception {

		return studyMapper.getStudyListCnt();
	}

	

	

	
	
}
