package reply.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;
import reply.dao.ReplyDao;
import reply.model.Reply;

public class ReplyModifyService {
	private ReplyDao dao = new ReplyDao();
	
	public Reply selectById(int no) {
		Connection conn = ConnectionProvider.getConnection();
		Reply modReply = null;
		
		try {
			modReply = dao.selectReply(conn, no);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return modReply; 
		
	}

}
