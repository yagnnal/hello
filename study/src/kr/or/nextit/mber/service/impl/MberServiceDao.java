package kr.or.nextit.mber.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.nextit.mber.service.MberVO;

public class MberServiceDao {
	
	private static MberServiceDao instance = null;
	
	public static MberServiceDao getInstance() {
		if(instance == null) {
			instance = new MberServiceDao();
		}
		return instance;
	}
	
	public MberVO getMemberItem(Connection conn, String memId) throws SQLException {
		
		StringBuilder query = new StringBuilder();
		
		query.append("		SELECT	                    ");
		query.append("		   	mem_id,                 ");
		query.append("		   	mem_pw,                 ");
		query.append("		   	mem_name,               ");
		query.append("		   	mem_phone,              ");
		query.append("		   	mem_email,              ");
		query.append("		   	reg_date                ");
		query.append("		FROM                        ");
		query.append("		    tb_member2              ");
		query.append("		where mem_id = ?	        ");
		
		PreparedStatement psmt = conn.prepareStatement(query.toString());
		
		psmt.setString(1, memId);
		
		ResultSet rs = psmt.executeQuery();
		
		MberVO result = null;
		
		if(rs.next()) {
			result = new MberVO();
			result.setMemId(rs.getString("mem_id"));
			result.setMemName(rs.getString("mem_name"));
			result.setMemPhone(rs.getString("mem_phone"));
			result.setMemEmail(rs.getString("mem_email"));
			result.setMemPw(rs.getString("mem_pw"));
			result.setRegDate(rs.getString("reg_date"));
		}
		
		return result;
	}
	
	public int updateMemberItem(Connection conn, MberVO parmas) throws SQLException {
		
		StringBuilder query = new StringBuilder();
		query.append("	UPDATE tb_member2 SET ");
		query.append("		mem_name = ? 	,	");
		query.append("		mem_pw = ?		,	");
		query.append("		mem_phone = ?	,	");
		query.append("		mem_email = ?	,	");
		query.append("		reg_date = sysdate 	");
		query.append("	WHERE					");
		query.append("		mem_id =  ? ");
		
		PreparedStatement pstmt = conn.prepareStatement(query.toString());
		
		pstmt.setString(1, parmas.getMemName());
		pstmt.setString(2, parmas.getMemPw());
		pstmt.setString(3, parmas.getMemPhone());
		pstmt.setString(4, parmas.getMemEmail());
		pstmt.setString(5, parmas.getMemId());
		
		//int result = pstmt.executeUpdate();
		//return result;
		return pstmt.executeUpdate();
		
	}
	
	public int deleteMemberItem(Connection conn, String memId) throws Exception {
		
		StringBuilder sql = new StringBuilder();
		sql.append("	DELETE FROM tb_member2 	");
		sql.append("	WHERE 					");
		sql.append("	mem_id = ?	 			");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setString(1, memId);
		
		return pstmt.executeUpdate();
		
	}

}
