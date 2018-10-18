package kr.or.nextit.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.board.service.BoardService;
import kr.or.nextit.board.service.BoardVo;
import kr.or.nextit.board.service.impl.BoardServiceImpl;
import kr.or.nextit.common.web.IController;
import kr.or.nextit.login.service.LoginVo;

public class BoardUpdateProcController implements IController {
	
	private BoardService boardService = new BoardServiceImpl();

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		BoardVo params = new BoardVo();
		
		params.setSeqNo(req.getParameter("seqNo"));
		params.setTitle(req.getParameter("title"));
		params.setContents(req.getParameter("contents"));
		
		LoginVo loginInfo = (LoginVo) req.getSession().getAttribute("loginInfo");
		
		if(loginInfo != null) {
			params.setUpUser(loginInfo.getUserName());
		}else {
			params.setUpUser("guest");
		}
		
		boardService.updateBoardItem(params );
		
		
		return String.format("/board/boardView.do?seqNo=%s", params.getSeqNo());
	}

}
