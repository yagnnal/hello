package kr.or.nextit.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.board.service.BoardService;
import kr.or.nextit.board.service.impl.BoardServiceImpl;
import kr.or.nextit.common.web.IController;

public class BoardDeleteProcController implements IController {

	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String seqNo = req.getParameter("seqNo");
		boardService.deleteBoardItem(seqNo);
		
		
		return "/board/boardList.do";
	}

}
