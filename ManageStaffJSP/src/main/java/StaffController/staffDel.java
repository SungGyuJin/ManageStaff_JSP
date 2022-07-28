package StaffController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.DBcon;

@WebServlet("/staffDel")
public class staffDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String delChk[] = request.getParameterValues("delChk");
		
		String sql = "Delete From emp_tbl_01 where empno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBcon.getConnection();
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i < delChk.length; i++) {
				pstmt.setString(1, delChk[i]);
				pstmt.executeUpdate();
			}
			System.out.println("삭제 개수: " + delChk.length);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("staffList.jsp");
	}

}
