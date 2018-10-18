package kr.or.nextit.mber.service.impl;

import java.sql.Connection;

import kr.or.nextit.jdbc.ConnectionPool;
import kr.or.nextit.mber.service.MberService;
import kr.or.nextit.mber.service.MberVO;

public class MberServiceImpl implements MberService {

	ConnectionPool pool = ConnectionPool.getInstance();

	private MberServiceDao dao = MberServiceDao.getInstance();

	@Override
	public MberVO getMemberItem(String memId) {

		Connection conn = null;

		try {
			conn = pool.getConnection();

			MberVO result = dao.getMemberItem(conn, memId);

			result.setState(true);
			result.setMessage("정상처리");

			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			MberVO result = new MberVO();
			result.setState(false);
			result.setMessage(e.getMessage());

			return result;
		} finally {
			if (conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}

	}


	@Override
	public MberVO updateMemberItem(String memId, String memPw, String memName, String memPhone, String memEmail) {
		
		MberVO params = new MberVO();
		
		params.setMemId(memId);
		params.setMemPw(memPw);
		params.setMemName(memName);
		params.setMemPhone(memPhone);
		params.setMemEmail(memEmail);
		
		Connection conn = null;
		
		try {
			conn = pool.getConnection();
			
			int result = dao.updateMemberItem(conn, params);
			if(result > 0) {
				params.setState(true);
				params.setMessage(
						String.format("%d : 건이 처리되었습니다.", result)
						);
			} else {
				throw new Exception(
						String.format(" %d : 처리된 결과가 없습니다.", result)
						);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			params.setState(false);
			params.setMessage(e.getMessage());
		} finally {
			if (conn != null) {
				try { pool.releaseConnection(conn); } 
				catch (Exception e) { }	
			}
			
		}
		
		// TODO Auto-generated method stub
		return params;
	}

	@Override
	public boolean deleteMemberItem(String memId) {
		
		Connection conn = null;
		
		try {
			conn = pool.getConnection();
			int result = dao.deleteMemberItem(conn, memId);
			System.out.println(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (conn != null ) {
				pool.releaseConnection(conn);
			}
		}
		
		
	}

}
