package article.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;

public class ArticleDao {
	
	public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String sql = "SELECT rn, article_no, writer_id, writer_name, title, regdate, moddate, read_cnt "
//							 	+"FROM (SELECT article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, "
//							 						+"ROW_NUMBER() OVER (ORDER BY article_no DESC) rn "
//							 				+"FROM article) "
//							 	+"WHERE rn  BETWEEN ? AND ?";		
		
		String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY article_no DESC) rn, article_no, writer_id, writer_name, title, regdate, moddate, read_cnt "
															 +"FROM article) "
								+"WHERE rn  BETWEEN ? AND ?";
		
//		String sql = "SELECT * FROM article ORDER BY article_no DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, (startRow-1) * size + 1);
			pstmt.setInt(2, startRow * size);
			rs = pstmt.executeQuery();
			List<Article> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			
			return result;
			
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	
	}
	
	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(rs.getInt("article_no"),
					new Writer(
								rs.getString("writer_id"),
								rs.getString("writer_name")),
								rs.getString("title"),
								rs.getTimestamp("regdate"),
								rs.getTimestamp("moddate"),
								rs.getInt("read_cnt"));
		
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM article";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}
	
	public Article insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "INSERT INTO article "
								+"(writer_id, writer_name, title, regdate, moddate, read_cnt) "
								+"VALUES (?, ?, ?, SYSDATE, SYSDATE, 0) ";
		
		String subSql =  "SELECT * FROM (SELECT * FROM article ORDER BY writer_id DESC) WHERE ROWNUM = 1";
		
		try {
//			pstmt = conn.prepareStatement(sql, new int[] {1, 5, 6});
			pstmt = conn.prepareStatement(sql, new String[] {"article_no" , "regdate", "moddate"});
			//, new int[] {1, 5, 6}
			pstmt.setString(1, article.getWriter().getId());
			pstmt.setString(2, article.getWriter().getName());
			pstmt.setString(3, article.getTitle());
			
			int insertedCount = pstmt.executeUpdate();
			
			if (insertedCount > 0) {
				rs = pstmt.getGeneratedKeys();
				Date regDate = null;
				Date modDate = null;
//				stmt = conn.createStatement();
//				rs = stmt.executeQuery(subSql);
				if (rs.next()) {
					Integer newNum = rs.getInt(1);
					regDate = rs.getTimestamp(2);
					modDate = rs.getTimestamp(3);
					Article art = new Article(newNum, 
																		article.getWriter(),
																		article.getTitle(),
																		regDate,
//																		article.getRegDate(),
																		modDate,
//																		article.getModifielDate(),
																		0);
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
