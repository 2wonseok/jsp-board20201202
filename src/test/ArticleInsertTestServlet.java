package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.dao.ArticleDao;
import article.model.Article;
import article.model.Writer;
import jdbc.ConnectionProvider;

/**
 * Servlet implementation class ArticleInsertTestServlet
 */
@WebServlet("/testArticleInsert1")
public class ArticleInsertTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleInsertTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectionProvider.getConnection();
		Article article = new Article(
											0,
											new Writer("b", "b"),
											"title3333",
											null,
											null,
											0
											);
		ArticleDao dao = new ArticleDao();
		try {
			Article n = dao.insert(conn, article);
			if (n != null) {
			System.out.println("key:" + n.getNumber());
			System.out.println("regDate: " + n.getRegDate());
			System.out.println("modDate: " + n.getModifielDate());
			} else {
				System.out.println("입력 실패");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
