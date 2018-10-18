package kr.or.nextit.mber.service;

public interface MberService {
	
	/**
	 * 회원 상세 정보
	 * @param memId
	 * @return
	 */
	public MberVO getMemberItem(String memId);
	
	/**
	 * 회원 정보 수정
	 * @param memId
	 * @param memPw
	 * @param memName
	 * @param memPhone
	 * @param memEmail
	 * @return
	 */
	public MberVO updateMemberItem(
			String memId,
			String memPw,
			String memName,
			String memPhone,
			String memEmail
			);
	
	/**
	 * 회원 삭제
	 * @param memId
	 * @return
	 */
	public boolean deleteMemberItem(String memId);

}
