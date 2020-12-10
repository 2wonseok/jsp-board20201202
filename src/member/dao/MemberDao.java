package member.dao;

import java.sql.*;
import java.util.Date;

import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {
	
	public Member selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		String sql = "SELECT memberid, name, password, regdate FROM member WHERE memberid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new Member();
				member.setId(rs.getString(1));
				member.setName(rs.getString(2));
				member.setPassword(rs.getString(3));
				member.setRegDate(rs.getTimestamp(4));
			}
			return member;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	public void insert(Connection conn, Member mem) throws SQLException {
		String sql = "INSERT INTO MEMBER VALUES (?, ?, ?, ?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));
			
			pstmt.executeUpdate();
		} 
	}
	
	public void update(Connection conn, Member member) throws SQLException {
		String sql = "UPDATE member SET name = ?, password = ? WHERE memberid = ? ";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getId());
			
			pstmt.executeUpdate();
		}
	}

	public void remove(Connection conn, Member member) throws SQLException {
		String sql = "DELETE FROM member WHERE memberid = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, member.getId());
			
			pstmt.executeUpdate();
		}
		
	}
}
