package kr.or.nextit.member;

import java.util.HashMap;
import java.util.List;


public interface MemberService {
	
	
	/**
	 * HachMap 회원 가입
	 * @author pc35
	 *
	 */
	public void insertUserInfo(HashMap<String, Object> params);
	
	public MemberVO insertUserInfo(String userId, HashMap<String, Object> params);
	
	public List<MemberVO> getMemberList(MemberVO memberVo) throws Exception;
	
	/**
	 * 선택된(uesrId) 회원 정보를 가지고 오는 것
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public MemberVO getMemberItem(String userId)throws Exception;

}
