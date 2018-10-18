package kr.or.nextit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

// web.xml에 filter-mapping 이랑 같음 방법 2가지
// urlPatterns 어디에 적용할껀지 배열로 적용할수 있음
@WebFilter(filterName="TimerFilter", urlPatterns= {"/","/*"}, description="프로세스 실행 시간 체크")
public class TimerFilter implements Filter {

	@Override
	public void destroy() {
		// 메모리에서 내려갈때
		// 대체적으로 init 설정한 자원을 정리해야 하는 경우
		System.out.println("TimerFilter destroy 메서드 호출, 나 쥬금");

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		// 주의 : req 타입이 ServletRequest이므로 HttpServletRequest로 형변환해서 작업을 해야 할 때도 있음
		HttpServletRequest myreq = (HttpServletRequest) req;
		
		// 전처리 부분
		long startTime = System.currentTimeMillis();
		System.out.println("TimerFilter" + myreq.getRequestURI()+", 시작 : " + startTime);
		
		req.setAttribute("title", "넥스트 IT(Filter Test)");
		
		// 여기가 포인트
		chain.doFilter(req, resp);	// 요청한 url 실행되고 req,resp바꾸고 끝남
		// @WebFilter로 모든 페이지에 적용해서 모든페이지에 request, response 적용
		
		req.setAttribute("title2", "chain.doFilter 이후 테스트");	// 적용X doFilter()하고 끝나서
		
		long endTime = (System.currentTimeMillis() - startTime);
		
		// 후처리 부분
		System.out.println("TimerFilter"+myreq.getRequestURI()+", 걸린시간 : " + endTime);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// 메모리에 올라올 때
		// 초기화해야할 자원이 있으면
		System.out.println("TimerFilter INIT 메서드 호출");
	}

}
