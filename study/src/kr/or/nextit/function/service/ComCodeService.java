package kr.or.nextit.function.service;

import java.util.List;

import kr.or.nextit.common.error.BizException;

public interface ComCodeService {
	
	/**
	 * groupId를 가지고서 비지니스 플로우를 처리하는 기능으로
	 * 공통 코드 리스트를 반환
	 * @param groupId
	 * @return List<CommCodeVO>
	 */
	public List<CommCodeVO> getCodeList(String groupId);
	
	/**
	 * key값을 넘겨서 CommcodeVO 객체를 반환
	 * @param CodeKey
	 * @return
	 */
	public CommCodeVO getCodeName(String codeKey);

	public void getErrorTest(String testValue) throws Exception;

	public void getErrorTest2(String testValue) throws Exception;
	
	public void getBizErrorTest(String testValue) throws BizException;

	public void getBizErrorTest2(String testValue) throws Exception;
	
	/**
	 * 공통 코드 테이블에서 IP 목록을 가지고 옴
	 * @return
	 * @throws Exception
	 */
	public List<CommCodeVO> getIpList() throws Exception;
	
	/**
	 * 클라이언트 접근 IP 정보를 조건으로 접근 승인 정보 체크
	 * @param clientIp
	 * @return
	 * @throws Exception
	 */
	public CommCodeVO getIpItem(String clientIp) throws Exception;
}
