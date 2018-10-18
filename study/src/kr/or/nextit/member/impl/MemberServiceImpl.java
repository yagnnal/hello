package kr.or.nextit.member.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.nextit.function.MemberUtil;
import kr.or.nextit.function.service.CommCodeVO;
import kr.or.nextit.jdbc.MybatisSqlSessionFactory;
import kr.or.nextit.member.MemberService;
import kr.or.nextit.member.MemberVO;
import kr.or.nextit.member.service.impl.MemberMapper;

public class MemberServiceImpl implements MemberService {
	
	// mybatis session Factory 객체 인스턴스 생성
	private SqlSessionFactory sessionFacotory = MybatisSqlSessionFactory.getSqlSessionFactory();
	
	private MemberMapper memberMapper;

	@Override
	public void insertUserInfo(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		System.out.println(params);
		System.out.println(params);
		System.out.println(params);

	}

	@Override
	public MemberVO insertUserInfo(String userId, HashMap<String, Object> params) {
		MemberVO result = new MemberVO();
		
		result.setUserId(userId);
		result.setUserName((String)params.get("userName"));
		result.setUserEmail(String.format("신청하신 : %s", params.get("userEmail")));
		
		List<CommCodeVO> hobbyItems = MemberUtil.getHobbyItems();
		String[] userHobbys = (String[]) params.get("userHobby");
		
		int i=0;
		for(String userHobby : userHobbys) {
			for(CommCodeVO item : hobbyItems) {
				if(userHobby.equals(item.getKey())) {
					userHobbys[i] = String.format("%s (%s)", item.getValue(),item.getKey());
					i++;
					break;
				}
			}
		}
		
		result.setUserHobby(userHobbys);
		return null;
	}

	@Override
	public List<MemberVO> getMemberList(MemberVO memberVo) throws Exception {
		
		SqlSession session = null;
		
		try {
			
			session = sessionFacotory.openSession();
			
			memberMapper = session.getMapper(MemberMapper.class);
			
			return memberMapper.selectMemberList(memberVo);
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
		return null;
	}

	@Override
	public MemberVO getMemberItem(String userId) throws Exception {
		
		SqlSession session = null;
		
		try {
			session = sessionFacotory.openSession();
			
			memberMapper = session.getMapper(MemberMapper.class);
			
			MemberVO memberInfo = memberMapper.selectMemberItem(userId);
			
			// insert update delete 사용시에만 사용
			// session.commit();
			
			return memberInfo;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			// insert update delete 구현시 에러가 발생하면, 추가 변경 삭제된 데이터를 원래 상태로 복구를 하겠다.
			// session.rollback();
			
			// return mew MemberVO();	// nullPointException 발생X
			return null;
			
		} finally {
			if(session != null) {
				try {
					session.close();
				}catch(Exception e) {
					System.err.println(e.getMessage());
				}
			}
		}
	}

}
