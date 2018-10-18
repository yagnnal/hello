package kr.or.nextit.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.board.service.BoardService;
import kr.or.nextit.board.service.BoardVo;
import kr.or.nextit.board.service.impl.BoardServiceImpl;
import kr.or.nextit.common.web.IController;

public class BoardViewController implements IController{

	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("BoardViewController.process() 실행");
		
		String seqNo = req.getParameter("seqNo");
		
		BoardVo boardVo = new BoardVo();
		boardVo.setSeqNo(seqNo);
		
		BoardVo boardView = boardService.getBoardItem(boardVo );
		
		req.setAttribute("boardView", boardView);
		
		
		return "/board/BoardView";
	}

}
