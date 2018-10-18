package kr.or.nextit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncordingFilter implements Filter {

	private String encoding = "UTF-8";
	
	// was서버가 종료가 될때 자원 리소스 해제 할때
	@Override
	public void destroy() {
		System.out.println("CharacterEncodingFilter.destroy");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("CharacterEncodingFilter.doFilter");
		
		// 필터 작업
		request.setCharacterEncoding(encoding);
		
		// request, response바껴서
		chain.doFilter(request, response);
		
	}

	// 서버 시작될때
	@Override
	public void init(FilterConfig config) throws ServletException {
		
		System.out.println("CharacterEncodingFilter.init");
		
		// 필터 초기화 작업 web.xml에 filter에 init-pram
		encoding = config.getInitParameter("encoding");
		
		if(encoding == null) {
			encoding = "UTF-8";
		}
	}

}
