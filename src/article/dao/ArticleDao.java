package article.dao;

import java.sql.*;
import java.util.Date;

import article.model.Article;
import jdbc.JdbcUtil;

public class ArticleDao {
	
	public Article insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "INSERT INTO article "
								+"(writer_id, writer_name, title, regdate, moddate, read_cnt) "
								+"VALUES (?, ?, ?, ?, ?, ?) ";
		String subSql = "SELECT last_insert_id() FROM article";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, article.getWriter().getId());
			pstmt.setString(2, article.getWriter().getName());
			pstmt.setString(3, article.getTitle());
			pstmt.setTimestamp(4, toTimestamp(article.getRegDate()));
			pstmt.setTimestamp(5, toTimestamp(article.getModifielDate()));
			int insertedCount = pstmt.executeUpdate();
			
			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(subSql);
				if (rs.next()) {
					Integer newNum = rs.getInt(1);
					Article art = new Article(newNum, 
																		article.getWriter(),
																		article.getTitle(),
																		article.getRegDate(),
																		article.getModifielDate(), 0);
					return art;
				}
			}
			
			return null;
		} finally {
			JdbcUtil.close(rs, stmt, pstmt);
		}
	}

	private Timestamp toTimestamp(Date regDate) {
		// TODO Auto-generated method stub
		return null;
	}
}
