package poly.persistance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import config.Mapper;
import poly.dto.StudyDTO;

@Mapper("StudyMapper")
public interface IStudyMapper {

	List<StudyDTO> getStudyList(@Param("start")int start, @Param("end")int end) throws Exception;

	int doStudyForm(StudyDTO pDTO);

	StudyDTO getStudyDetail(StudyDTO pDTO);

	int updateStudyDetail(StudyDTO pDTO);

	int deleteStudyDetail(StudyDTO pDTO);

	int getStudyListCnt();
}
