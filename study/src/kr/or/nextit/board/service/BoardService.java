package kr.or.nextit.board.service;

import java.util.List;

public interface BoardService {

	/**
	 * Board 글 등록
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public boolean InsertBoardItem(BoardVo boardVo) throws Exception;
	
	/**
	 * Board List 구현
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public List<BoardVo> getBoardList(BoardVo boardVo) throws Exception;
	
	/**
	 * 1건을 가지고 옴
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public BoardVo getBoardItem(BoardVo boardVo) throws Exception;
	
	
	/**
	 * seqNo로 삭제
	 * @param seqNo
	 * @throws Exception
	 */
	public void deleteBoardItem(String seqNo) throws Exception;
	
	/**
	 * 제목과 내용 수정
	 * @param params
	 * @throws Exception
	 */
	public void updateBoardItem(BoardVo params) throws Exception;
	
	
}
