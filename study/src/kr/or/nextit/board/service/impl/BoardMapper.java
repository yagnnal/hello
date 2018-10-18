package kr.or.nextit.board.service.impl;

import java.util.List;

import com.sun.corba.se.impl.presentation.rmi.ExceptionHandlerImpl;

import kr.or.nextit.board.service.BoardVo;

public interface BoardMapper {

	/**
	 * 신규 글 작성 등록 하는 기능
	 * @param boardVo
	 * @throws Exception
	 */
	public void insertBoardItem(BoardVo boardVo) throws Exception;
	
	
	/**
	 * 데이터 베이스에서 db 목록 조회
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public List<BoardVo> selectBoardList(BoardVo boardVo) throws Exception;
	
	/**
	 * seqNo 값으로 1건의 레코드를 가지고옴
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public BoardVo selectBoardItem(BoardVo boardVo) throws Exception;
	
	/**
	 * 조회수 증가
	 * @param boardVo
	 * @throws Exception
	 */
	public void updateBoardCountItem(BoardVo boardVo) throws Exception;


	/**
	 * seqNo 값으로 삭제
	 * @param seqNo
	 * @throws Exception
	 */
	public void deleteBoardItem(String seqNo) throws Exception;
	
	/**
	 * 글 수정
	 * @param params
	 * @throws Exception
	 */
	public void updateBoardItem(BoardVo params) throws Exception; 
}
