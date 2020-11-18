package LoginDemo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Types;

public class DBConnector {
	public Connection connection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/websparrow", "root", ""); //change as needed
	}

	public String getUser(String user_name, String user_pass) { //change as needed
		try {
			CallableStatement cs = connection().prepareCall("{call getUser(?,?,?)}");
			cs.setString(1, user_name);
			cs.setString(2, user_pass);
			cs.registerOutParameter(3, Types.VARCHAR);
			cs.executeQuery();
			return cs.getString(3);
		} catch (Exception e) {
			return e.getMessage();
		}
	}

	//public String addUser(String user_name, String user_email, String user_pass) {
	//	try {
	//		CallableStatement cs = connection().prepareCall("{call addUser(?,?,?,?)}");
	//		cs.setString(1, user_name);
	//		cs.setString(2, user_email);
	//		cs.setString(3, user_pass);
	//		cs.registerOutParameter(4, Types.VARCHAR);
	//		cs.executeQuery();
	//		return cs.getString(4);
	//	} catch (Exception e) {
	//		return e.getMessage();
	//	}
	//}

}