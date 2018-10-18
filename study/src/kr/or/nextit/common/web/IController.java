package kr.or.nextit.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IController {
	
	/**
	 * 페이지를 리다이렉트 처리 할지 안할지 여부
	 * @return
	 */
	public boolean isRedirect();
	
	/**
	 * 비지니스(업무) 처리 레이어 영역
	 * @param req
	 * @param resp
	 * @return 해당하는 프로세서가 실행되고 뷰(view)단으로 넘겨줌
	 * @throws Exception
	 */
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception;

}
