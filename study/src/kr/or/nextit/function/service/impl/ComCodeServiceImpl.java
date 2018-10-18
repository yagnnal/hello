package kr.or.nextit.function.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.nextit.common.error.BizException;
import kr.or.nextit.function.service.ComCodeService;
import kr.or.nextit.function.service.CommCodeVO;
import kr.or.nextit.jdbc.ConnectionPool;
import kr.or.nextit.jdbc.MybatisSqlSessionFactory;

/**
 * 비지니스 레이어 영역으로 데이터베이스 연결 객체를 생성하고, 요청된 param값을 가지고 제어해주는 비지니스 플로우
 * 
 * @author pc35
 *
 */
public class ComCodeServiceImpl implements ComCodeService {

	// mybatis 전용 db pool관리
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	/**
	 * 커넥션 풀 객체 인스턴스 생성
	 */
	private ConnectionPool pool = ConnectionPool.getInstance();

	/**
	 * 데이터 레이어 영역의 객체 인스턴스 생성
	 */
	private ComCodeServiceDao codeDao = ComCodeServiceDao.getInstance();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * kr.or.nextit.function.service.ComCodeService#getCodeList(java.lang.String)
	 */
	@Override
	public List<CommCodeVO> getCodeList(String groupId) {

		Connection conn = null;

		try {

			conn = pool.getConnection();
			return codeDao.selectCodeList(conn, groupId);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			// return null; // null체크를 해야함
			return new ArrayList<>();
		} finally {
			if (conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
			}
		}

	}

	@Override
	public CommCodeVO getCodeName(String codeKey) {

		Connection conn = null;
		CommCodeVO codeVO = null;
		try {
			conn = pool.getConnection();
			codeVO = codeDao.selectCodeName(conn, codeKey);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
			}
		}

		return codeVO;
	}

	@Override
	public void getErrorTest(String testValue) throws RuntimeException {

		System.out.println(String.format("형변환 전 : %s ", testValue));
		
				
		try {
		
			int num = Integer.parseInt(testValue);
			System.out.println(String.format("형변환 후 : %d ", num));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			throw new RuntimeException("문자열을 정수로 변경해서 에러 발생");	// 무슨 exception인지 모를때
			
//			throw new NumberFormatException("문자열을 정수로 변경해서 에러 발생");
		}
		
	}
	
	@Override
	public void getErrorTest2(String testValue) throws Exception {

		System.out.println(String.format("형변환 전 : %s ", testValue));
		
				
		try {
		
			int num = Integer.parseInt(testValue);
			System.out.println(String.format("형변환 후 : %d ", num));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new Exception("문자열을 정수로 변경해서 에러 발생");	// 무슨 exception인지 모를때

		}
		
	}

	@Override
	public void getBizErrorTest(String testValue) throws BizException {
		
		try {
			
			int num = Integer.parseInt(testValue);
			System.out.println(String.format("형변환 후 : %d ", num));

		} catch (NumberFormatException e) {
//		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

//			throw new BizException();
//			throw new BizException("담당자에게 연락 하셈");
//			throw new BizException(String.format("비지니스 로직 error : %s", e.getMessage()));
//			throw new BizException("error 발생", e);
			throw new BizException(e.getMessage(),e);
			

		}
		
		
	}

	@Override
	public void getBizErrorTest2(String testValue) throws Exception {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(testValue);
		System.out.println(String.format("형변환 후 : %d ", num));
		
	}

	private ComMapper comMapper;
	@Override
	public List<CommCodeVO> getIpList() throws Exception {
		
		SqlSession session = null;
		
		try {
			
			// sqlSessionFactory에서 session 객체 인스턴스 생성
			// db접근 pool에서 session 가지고 와서 생성
			session = sqlSessionFactory.openSession();
			
			// comMapper 객체 타입에 마춰서 comMapper.xml 구현체를 인스턴스 생성
			comMapper = session.getMapper(ComMapper.class);
			
			// params type (CommCodeVO) param 값을 설정
			CommCodeVO params =new CommCodeVO();
			params.setKey("IP");
			
			// comMapper.xml getIpList 실행한 결과를 반환
			// <select ~
			List<CommCodeVO> ipList = comMapper.getIpList(params);
			
			return ipList;
			
		} catch (Exception e) {
			e.printStackTrace();
//			return new ArrayList<>();
			return null;
			
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
	}

	@Override
	public CommCodeVO getIpItem(String clientIp) throws Exception {
		
		SqlSession session = null;
		
		try {
			
			session = sqlSessionFactory.openSession();
			
			// mybatis-config 에 <mappers ~ .xml 가져옴
			// interface객체를 통해서 xml에 질의어 작성
			// ComMapper.class : namespace가 ComMapper인거 찾아와서(ComMapper.xml) 
			// session.getMapper : 인스턴스 생성 ((= new ComMapper상속받은 클래스) 랑 같음)
			comMapper = session.getMapper(ComMapper.class);
		
			CommCodeVO param = new CommCodeVO();
			param.setKey(clientIp);
			
			// 최초 등록된 아이피 조회
			CommCodeVO resultIpInfo = comMapper.getIpItem(param);
			
			if(resultIpInfo == null) {
				// 아이피가 등록되어 있지 않으면 등록
				comMapper.insertIpItem(param);
				session.commit();
			}
			
			// 등록된 아이피를 다시 조회해서 결과 반환
			return comMapper.getIpItem(param);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
//			return new CommCodeVO();
		}finally {
			if(session != null) {
				try {
					session.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
				}
			}
		}
		
		
	}

}
