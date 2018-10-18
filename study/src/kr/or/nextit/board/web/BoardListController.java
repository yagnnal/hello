package kr.or.nextit.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.board.service.BoardService;
import kr.or.nextit.board.service.BoardVo;
import kr.or.nextit.board.service.impl.BoardServiceImpl;
import kr.or.nextit.common.web.IController;

public class BoardListController implements IController{
	
	private BoardService boardService = new BoardServiceImpl();

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		System.out.println("BoardListController.process() 실행");
		
		BoardVo boardVo = new BoardVo();
		
		boardVo.setWhereType(req.getParameter("whereType"));
		boardVo.setSearchText(req.getParameter("searchText"));
		boardVo.setServiceType(req.getParameter("serviceType"));
		
		
		
		List<BoardVo> boardList = boardService.getBoardList(boardVo);
		
		req.setAttribute("boardList", boardList);
		
		return "/board/BoardList";
	}

}
