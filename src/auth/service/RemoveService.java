package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;

public class RemoveService {
	private MemberDao memberDao = new MemberDao();
	
	public User remove(String id) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			memberDao.remove(conn, id);

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}
}
