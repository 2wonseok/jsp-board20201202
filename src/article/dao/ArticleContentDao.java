package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.ArticleContent;
import article.model.Writer;
import jdbc.JdbcUtil;

public class ArticleContentDao {
	
	public ArticleContent insert(Connection conn, ArticleContent content) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO article_content "
								+"(article_no, content) VALUES (?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, content.getNumber());
			pstmt.setString(2, content.getContent());
			int insertedCount = pstmt.executeUpdate();
			
			if (insertedCount > 0) {
				return content;
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
