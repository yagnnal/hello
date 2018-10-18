package kr.or.nextit.member.service.impl;

import java.util.HashMap;
import java.util.List;

import kr.or.nextit.member.MemberVO;

/**
 * 회원 정보를 데이터 베이스에서 처리한결과를 받아오는
 * 데이터 레이어 처리 영역
 * @author pc35
 *
 */
public interface MemberMapper {
	
	/**
	 * 데이터 회원 정보를 목록으로 받아오는 기능
	 * @param memberVo
	 * @return
	 * @throws Exception
	 */
	public List<MemberVO> selectMemberList(MemberVO memberVo) throws Exception;
	
	/**
	 * 선택된 정보(userId)를 가지고 회원정보를 가지고 오는 기능
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public MemberVO selectMemberItem(String userId) throws Exception;
	
	public HashMap<String, Object> selectMemberInfo(HashMap<String, Object> paams) throws Exception;

	public List<HashMap<String, Object>> selectMemberInfoList(HashMap<String, Object> paams) throws Exception;

}
