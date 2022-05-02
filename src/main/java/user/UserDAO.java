package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	private Connection conn = DatabaseUtil.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int login(String userID, String  userPassword) {
		String SQL = "SELECT password FROM user WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1;
				}
				else {
					return 0;
				}
			}
			return -1;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?,?,?)";
		try {
			System.out.println("3");
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserPassword());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("4");
			e.printStackTrace();
		}
		return -1;
	}
}
