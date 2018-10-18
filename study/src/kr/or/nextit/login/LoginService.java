package kr.or.nextit.login;

import javax.servlet.http.HttpServletRequest;

import kr.or.nextit.login.service.LoginVo;

public interface LoginService {
	
	public void loginCheck(HttpServletRequest req);

	public LoginVo loginCheck(String userId, String userPw);
}
