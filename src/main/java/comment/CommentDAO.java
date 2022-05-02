package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;


public class CommentDAO {
	private Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		String SQL = "SELECT commentID FROM comment ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	public int write(int boardID, String userID, String commentText) {
		String SQL = "INSERT INTO comment VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, commentText);
			pstmt.setInt(6, 1);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Comment> getList() {
		String SQL = "SELECT * FROM comment ORDER BY boardID DESC"; 
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setBoardID(rs.getInt(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCommentDate(rs.getString(4));
				cmt.setCommentText(rs.getString(5));
				cmt.setCommentAvilable(rs.getInt(6));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Comment getComment(int commentID) {
		String SQL = "SELECT * FROM comment WHERE commentID = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  commentID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setBoardID(rs.getInt(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCommentDate(rs.getString(4));
				cmt.setCommentText(rs.getString(5));
				cmt.setCommentAvilable(rs.getInt(6));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}