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

@WebServlet("/staffModify")
public class staffModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String empno = request.getParameter("empno");
		String empname = request.getParameter("empname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String startdate = request.getParameter("startdate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		String sql = "Update emp_tbl_01 set "
				   + "empname = ?"
				   + ", phone = ?"
				   + ", address = ?"
				   + ", startdate = ?"
				   + ", grade = ?"
				   + ", city = ? "
				   + "Where empno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			con = DBcon.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, empname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, startdate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setString(7, empno);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("staffList.jsp");
		
	}

}
