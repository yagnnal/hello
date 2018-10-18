package kr.or.nextit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.nextit.login.service.LoginVo;


public class SessionCheckFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		// 클라이언트에서 요청한 정보를 받음
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		// 로그인 페이지를 적용하지 않을 URI 주소 목록
		String[] ch = {"/13/loginForm.jsp","/13/loginProc.jsp","/14/memberInsertForm.jsp","/14/memberInsertProc.jsp"};
		
		boolean chFlag = false;
		
		for(String chUri : ch) {
			System.out.println(chUri);
			if(uri.equals(chUri)) {
				chFlag = true;
			}
		}
		
		
		LoginVo loginVo = (LoginVo)session.getAttribute("loginInfo");
		
		if(loginVo != null) {
			System.out.println(loginVo);
			System.out.println(loginVo.getUserId());
			System.out.println(loginVo.getUserName());
			chain.doFilter(req, resp);
		}else {
			System.out.println("로그인 해주셈");

			if(chFlag) {
				chain.doFilter(req, resp);
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("/13/loginForm.jsp");
				dispatcher.forward(req, resp);
			}
			
			
			// 이동시킬 주소
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/13/loginForm.jsp");
//			dispatcher.forward(req, resp);
		}
		
		// 필터적용 하려면 어노테이션(@WebWebFilter)쓰던가 web.xml에 filter 	

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
