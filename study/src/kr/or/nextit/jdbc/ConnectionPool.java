package kr.or.nextit.jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

public class ConnectionPool {
	
	// 커넥션 풀
	private static Vector<Connection> pool = new Vector<>();
	
//	private static ConnectionPool instance = new ConnectionPool();
	private static ConnectionPool instance = null;
	
	public static ConnectionPool getInstance() {
		if(instance == null) {
			instance = new ConnectionPool();
		}
		return instance;
	}
	
	private ConnectionPool() {
		try {
			initPoll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 커넥션 풀 초기화
	private synchronized void initPoll() throws SQLException {
		
		// 생성하기 전에 혹시 남아있을수도 있으니까
		destroyPool();
		
		ConnectionFactory factory = ConnectionFactory.getInstance();
		
		for(int i = 0; i < factory.getMaxConnction(); i++) {
			Connection conn = factory.getConnection();
			pool.add(conn);
		}
		
		System.out.println(pool.size() + "개의 커넥션이 풀에 준비완료");
		
	}
	
	// 커넷션 풀 폐기
	private synchronized void destroyPool() throws SQLException {
		
		// pool에 들어있는거 하나씩 꺼내서 conn에 넣음
		for(Connection conn:pool) {
			conn.close();
		}
		
		pool.clear();
		
	}
	
	// 커넥션 대여(제공)
	public synchronized Connection getConnection() {
		// 동기화 꺼내올때는 건들일수 없게
		
		if(pool.size() == 0) {
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		// 빌려줘야 되니까 remove 몇개 남아있는지 모르니까 제일 마지막꺼 return
		Connection conn = pool.remove(pool.size()-1);
		
		return conn;
	}
	
	// 커넥션 반남(회수)
	public synchronized void releaseConnection(Connection conn) {
		pool.add(conn);
		notify();	// 없어서 wait 하고있는애 알려줌
		
	}
	
	
	
}
