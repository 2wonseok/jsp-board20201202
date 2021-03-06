package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDao;
import member.model.Member;
import member.service.DuplicateIdException;

public class RemoveService {
	private MemberDao memberDao = new MemberDao();
	
	public void removeMember(Member mem) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Member member = memberDao.selectById(conn, mem.getId());
			
			if (member == null || !member.getPassword().equals(mem.getPassword())) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			
			memberDao.remove(conn, member);

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
//		return null;
	}
}
