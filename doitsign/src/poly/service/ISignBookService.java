package poly.service;

import java.util.List;

import poly.dto.SignBookDTO;

public interface ISignBookService {
	
	
	int getSignBookListCnt() throws Exception;

	List<SignBookDTO> getSignBookList(int start, int end) throws Exception;
}
