package kr.or.nextit.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import kr.or.nextit.member.MemberVO;

public class MapTest {
	
	public static void main(String[] args) {
		
		
		HashMap<String, Object> parameterType = new HashMap<>();
		parameterType.put("memberVo", new MemberVO());
		parameterType.put("userId", "master");
		parameterType.put("userId", 3);
		//parameterType.put("userId", 3.14);
		
		List<MemberVO> memberList = new ArrayList<>();
		
		Set<String> keys = parameterType.keySet();
		for(String key : keys) {
			System.out.println(key);
			System.out.println(parameterType.get(key));
			memberList.add((MemberVO) parameterType.get(key));
		}
		
		for(MemberVO memberInfo : memberList) {
			System.out.println(memberInfo);
		}
		
		HashMap<String, Object> resultType = new HashMap<>();
		
		MemberVO memberVo = new MemberVO();
		memberVo.setUserId("");
		
		HashMap<String, Object> vo = new HashMap<>();
		vo.put("userId", memberVo.getUserId());
		vo.put("userName", memberVo.getUserName());
		vo.put("userEmail", memberVo.getUserEmail());
		
		
		
		
	}

}
