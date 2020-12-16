package reply.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import reply.dao.ReplyDao;

public class ReplyAddService {
	private ReplyDao dao = new ReplyDao();
	
	public void add(String userId, int articleNo, String body) throws SQLException {
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			dao.insert(conn, userId, articleNo, body);
		
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public void modify(String replyId, int articleNo, String body) throws SQLException {
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			dao.update(conn, replyId, articleNo, body);
		
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
