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
	
	public int delete(Connection conn, int no) throws SQLException {
		String sql = "DELETE FROM article_content WHERE article_no = ?";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			
			return pstmt.executeUpdate();
		}
	}
	
	public int update(Connection conn, int no, String content) throws SQLException {
		String sql = "UPDATE article_content SET content = ? WHERE article_no = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, content);
			pstmt.setInt(2, no);
			
			int cnt = pstmt.executeUpdate();
			return cnt;
		}
	}
	
	public ArticleContent selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM article_content WHERE article_no = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			ArticleContent content = null;
			
			if (rs.next()) {
				content = new ArticleContent(rs.getInt("article_no"), rs.getString("content"));
			}
//			System.out.println(content.getContent());
			return content;
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}
	
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
