<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%! Connection con=null;
PreparedStatement pstmt1=null;
ResultSet rs=null;
%>
<html>
<body>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","dhiru","dhiru");
	pstmt1=con.prepareStatement("delete from student where id=?");

	//String btn=request.getParameter("btn");
	int id=Integer.parseInt(request.getParameter("delete"));
	//out.print(id);
		//int id=Integer.parseInt(request.getParameter("id"));
		pstmt1.setInt(1,id);
		int i=pstmt1.executeUpdate();
		if(i>0)
		{
			%>
				<jsp:forward page="show.jsp"/>
			<%
				}
			else{
				out.println("cannot be deleted");
			}
	
}
catch(Exception e)
{
			
}
%>
</body>
</html>
