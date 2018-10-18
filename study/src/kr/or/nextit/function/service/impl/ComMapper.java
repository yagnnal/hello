package kr.or.nextit.function.service.impl;

import java.util.List;

import kr.or.nextit.function.service.CommCodeVO;

public interface ComMapper {
	
	/**
	 * 아이피 목록 조회
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<CommCodeVO> getIpList(CommCodeVO params) throws Exception;
	
	/**
	 * 클라이언트 IP 정보를 입력 받아 vo 객체 반환
	 * @param codeVo
	 * @return
	 * @throws Exception
	 */
	public CommCodeVO getIpItem(CommCodeVO codeVo) throws Exception;
	
	/**
	 * 요청된 Ip가 데이터 베이스에 없을 경우 db에 등록
	 * @param paramCode
	 * @throws Exception
	 */
	public void insertIpItem(CommCodeVO paramCode) throws Exception;

}
