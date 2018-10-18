package kr.or.nextit.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.nextit.function.MemberUtil;
import kr.or.nextit.function.service.CommCodeVO;

public class ReviewService {
	
	public void getRequestTest(HttpServletRequest request) {
		List<String> member = new ArrayList();
		
		member.add("노대현");
		member.add("김규남");
		member.add("김보미");
		member.add("박상원");
		member.add("김규리");

		request.setAttribute("memberList", member);
	}

	public static void getRequestCodeTest(HttpServletRequest req) {
		
		List<ReViewVO> result = new ArrayList<>();
		
		result.add(new ReViewVO("001","모니터"));
		result.add(new ReViewVO("002","키보드"));
		result.add(new ReViewVO("003","의자"));
		result.add(new ReViewVO("004","마우스"));
		result.add(new ReViewVO("005","책상"));
		
		req.setAttribute("codeList", result);
		
	}
	
	public HashMap<String, Object> getRequestParamsTest(HttpServletRequest request){
		
		HashMap<String, Object> result = new HashMap<>();
		
		String name = request.getParameter("userName");
	 	int age = Integer.parseInt(request.getParameter("userAge"));
		
	 	System.out.println(name);
	 	System.out.println(age);
	 	
	 	result.put("uName", name);
	 	result.put("uAge", age);
	 	
	 	List<CommCodeVO> hobbyItems = MemberUtil.getHobbyItems();
	 	
	 	result.put("hobbyList", hobbyItems);
	 	
	 	
		return result;
	}
	
	// 선택한 목록 값(key)의 value 배열로 반환
	public String[] selectHobby(String[] selectHobby) {
		
		String[] result = new String[selectHobby.length];
		int i=0;
		
		List<CommCodeVO> hobby = MemberUtil.getHobbyItems();
		
		for (String item : selectHobby) {
			//내가 선택한 값
			//out.println(items);
			for (CommCodeVO hitem : hobby) {
				// hobby리스트에 있는 모든 값
				if (item.equals(hitem.getKey())) {
					//내가 선택한 value와 hobby리스트의 key값 비교해서 선택한거만 이름 출력해줌
					//out.println(String.format("%s (%s) : 당신이 선택한 취미", hitem.getValue(), hitem.getKey()));
					result[i] = hitem.getValue();
					i++;
					break;
				} else {
					//out.println(String.format("%s (%s)", hitem.getValue(), hitem.getKey()));
				}
			}
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
}
