package kr.or.nextit.common.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.nextit.function.service.ComCodeService;
import kr.or.nextit.function.service.CommCodeVO;
import kr.or.nextit.function.service.impl.ComCodeServiceImpl;
import kr.or.nextit.login.service.LoginVo;

@WebFilter(filterName = "ipCheckFilter", urlPatterns = { "/test123/*" })	// test123일때 필터
public class IpCheckFilter implements Filter {

	private Map<String, String> ipMap;

	private ComCodeService codeService;

	@Override
	public void destroy() {
		// 자원정리
		ipMap = null;

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest myreq = (HttpServletRequest) req;
		HttpServletResponse myresp = (HttpServletResponse) resp;
		
//		// 로그인 체크
//		HttpServletRequest request = (HttpServletRequest) req;
//		HttpSession session = request.getSession();
//		LoginVo loginInfo = (LoginVo) session.getAttribute("loginInfo");
//
//		if(loginInfo != null) {
//			// 로그인 됨
//			chain.doFilter(req, resp);
//		}else {
//			// 로그인 안됨
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/13/loginForm.jsp");
//			dispatcher.forward(req, resp);
//		}
		
		String ip = req.getRemoteAddr();

		try {
			// 접근 승인 여부
			boolean flag = false;
			
			// ComCodeService구현체인 ComCodeServiceImpl에서 Ip받아서 setKey()해서 CommCodeVO로 변환함
			CommCodeVO resultCodeVo = codeService.getIpItem(ip);

			if (ip != null && resultCodeVo != null && ip.equals(resultCodeVo.getKey()) && "A".equals(resultCodeVo.getValue())) {
				
				chain.doFilter(req, resp);

			}else {
				throw new Exception(String.format("'%s' 사용자는 접근 금지", ip));
			}

			/*
			 * if(ip != null){ for(CommCodeVO codeVo : ipList) {
			 * if(ip.equals(codeVo.getKey()) && "A".equals(codeVo.getValue())) { // 접근 승인
			 * flag = true; break; }else { // 접근 불가
			 * 
			 * } } }else {
			 * 
			 * }
			if (flag) {
				chain.doFilter(req, resp);
			} else {
				
			}
			 * 
			 */

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("text/html");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Deny.jsp");
			dispatcher.forward(req, resp);
		}

		/*
		 * if(ip != null && ipMap.containsKey(ip)) { //존재하는 IP(Access/Deny)
		 * if("A".equals(ipMap.get(ip))){ // 허용
		 * System.out.println("존재하는 IP 승인==========="); chain.doFilter(req, resp); }else
		 * { //거부 System.out.println("존재하지 않는 IP 거부===========");
		 * resp.setCharacterEncoding("utf-8"); resp.setContentType("text/html");
		 * RequestDispatcher dispatcher = myreq.getRequestDispatcher("/Deny.jsp");
		 * dispatcher.forward(req, resp); } }else { // 존재하지 않는 IP // sendRedirect,
		 * forward System.out.println("존재하지 않는 IP index.jsp============");
		 * RequestDispatcher dispatcher = myreq.getRequestDispatcher("/Deny.jsp");
		 * dispatcher.forward(req, resp); }
		 */

		// chain.doFilter(req,resp);

	}

	private List<CommCodeVO> ipList = null;

	@Override
	public void init(FilterConfig arg0) throws ServletException {

		try {

			codeService = new ComCodeServiceImpl();
			// 데이터 베이스에서 IP 목록을 가져옴
			ipList = codeService.getIpList();

			// db에서 가져온 값
			for (CommCodeVO commCodeVo : ipList) {
				System.out
						.println(String.format("Ip Key = %s : 승인여부 = %s", commCodeVo.getKey(), commCodeVo.getValue()));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 초기화
		ipMap = new HashMap<>();
		ipMap.put("127.0.0.1", "D");
		ipMap.put("192.168.10.2", "A");
		ipMap.put("192.168.10.22", "A");
		ipMap.put("192.168.10.14", "A");

		System.out.println("ipMap data init() 등록된 IP 확인");
		Set<String> ipkey = ipMap.keySet();
		for (String key : ipkey) {
			System.out.println(String.format("Ip Key = %s : 승인여부 = %s", key, ipMap.get(key)));
		}
	}

}
