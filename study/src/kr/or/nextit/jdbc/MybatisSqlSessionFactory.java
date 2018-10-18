package kr.or.nextit.jdbc;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//	lib -> jar파일 선택 -> buildPath -> addbuildPath 
//	java resources -> referenced libraries에 추가함
/**
 * mybatis 
 * 파일에 등록된 정보에 의거하여 sessionFaction생성
 * (connection+pool)
 * @author pc35
 *
 */
public class MybatisSqlSessionFactory {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
			// mybatis 환경설정 파일 위치
			String resource = "/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			
			// mybatis-config.xml 을 읽어서 객체 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * sqlSessionFactory 반환
	 * @return
	 */
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
	

}
