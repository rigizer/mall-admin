package commons;

import java.sql.*;

public class DBUtil {
	public Connection getConnection() throws Exception { // 데이터베이스 접근
		// JDBC 드라이버 사용
		String dbDriver = "org.mariadb.jdbc.Driver";
		
		String dbAddr = "jdbc:mariadb://rigizer.kro.kr:3306/mall";		// 주소, 포트, 데이터베이스 이름
		String dbId = "goodee";											// 데이터베이스 계정 ID
		String dbPw = "java1004";										// 데이터베이스 계정 PW
		
		Class.forName(dbDriver);
		
		// 데이터베이스 접속
		Connection conn = DriverManager.getConnection(dbAddr, dbId, dbPw);
		
		return conn;
	}
}