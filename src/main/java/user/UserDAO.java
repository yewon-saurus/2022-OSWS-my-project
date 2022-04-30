package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			System.out.println("1");;
			
			// localhost:3306
			String dbURL = "jdbc:mysql://localhost:3306/myHomePage";
			String dbID = "root";
			String dbPW = "yewon12!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		}
		catch (Exception e) {
			System.out.println("2");
			e.printStackTrace();
		}
	}
	
	public int login(String userEmail, String  userPassword) {
		String SQL = "SELECT password FROM user WHERE email = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
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
			
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPassword());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("4");
			e.printStackTrace();
		}
		return -1;
	}
}
