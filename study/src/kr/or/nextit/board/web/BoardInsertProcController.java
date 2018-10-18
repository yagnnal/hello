package kr.or.nextit.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.nextit.board.service.BoardService;
import kr.or.nextit.board.service.BoardVo;
import kr.or.nextit.board.service.impl.BoardMapper;
import kr.or.nextit.board.service.impl.BoardServiceImpl;
import kr.or.nextit.common.web.IController;
import kr.or.nextit.jdbc.MybatisSqlSessionFactory;
import kr.or.nextit.login.service.LoginVo;

public class BoardInsertProcController implements IController{

	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		BoardVo boardVo = new BoardVo();
		boardVo.setTitle(req.getParameter("title"));
		boardVo.setContents(req.getParameter("contents"));
		boardVo.setServiceType(req.getParameter("serviceType"));
		
		LoginVo loginInfo = (LoginVo) req.getSession().getAttribute("loginInfo");
		
		if(loginInfo != null) {
			boardVo.setRegUser(loginInfo.getUserName());
			boardVo.setUpUser(loginInfo.getUserName());
		}else {
			boardVo.setRegUser("guest");
			boardVo.setUpUser("guest");
		}
		
		boolean result = boardService.InsertBoardItem(boardVo);
		
		if(result) {
			System.out.println("정상처리 되었습니다.");
		}else {
			System.out.println("에러 발생했습니다.");
		}
		
		return "/board/boardList.do";
	}

}
