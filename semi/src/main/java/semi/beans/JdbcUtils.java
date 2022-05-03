package semi.beans;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtils {

	
	//연결 모듈화
	//클래식 연결 코드 - 연결을 내가 생성하고 내가 종료하는 코드
//	public static Connection getConnection() throws Exception {
//		Class.forName("oracle.jdbc.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kh22", "kh22");
//		return con;
//	}

	
	//DBCP 방식 적용
	// = Database Connection Pool
	// 사전에 연결을 다수 생성해두고 대여하면서 사용하는 방식을 의미
	// 이미 등록한 자원(Context.xml) 파일에 있는 resource를 찾아야한다
	// 찾아낸 resource에서 연결을 얻어와서 반황하는 형태로 코드가 바뀌어야한다
	
//	private static DataSource src = context.xml에 있는 <Resource> 중에서 name="jdbc/oracle" 인 자원
	private static DataSource src; //일단 선언
	static {						//static 초기화 구문
	

		try {
			
			//1. 자원 탐색 도구를 생성
			Context ctx = new InitialContext();
			
			//2. 자원 탐색도구를 이용해서 등록된 자원 중 name = "jdbc/oracle"인 Resource를 찾도록 지시
			//"탐색을 위한 경로(Resource 등록되어있는 곳)"
			//java:comp/env/ <- 여기까지는 고정
			// Resource를 찾으면 객체로 불러오므로 downcasting으로 DataSource로 변환
			src = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");			
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	
	}
	
	
	
	//연결해둔 src를 이용해서 연결을 얻어온 뒤 반환하는 형태로 변경함 (연결을 더 이상 생성하지 않음)
	//전체 성능과 시간을 자동으로 계산하면서 실행
	public static Connection getConnection() throws Exception {
		return src.getConnection();
		
	}
	
	
}
