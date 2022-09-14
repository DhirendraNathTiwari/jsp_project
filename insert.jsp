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
	pstmt1=con.prepareStatement("insert into student values(?,?,?,?,?)");
	int id=Integer.parseInt(request.getParameter("id"));
	String name=request.getParameter("name");
	int m1=Integer.parseInt(request.getParameter("m1"));
	int m2=Integer.parseInt(request.getParameter("m2"));
	int m3=Integer.parseInt(request.getParameter("m3"));
	pstmt1.setInt(1,id);
	pstmt1.setString(2,name);
	pstmt1.setInt(3,m1);
	pstmt1.setInt(4,m2);
	pstmt1.setInt(5,m3);
		int i=pstmt1.executeUpdate();
		if(i>0)
		{
			%>
				<jsp:forward page="show.jsp"/>
			<%
				}
			else{
				out.println("cannot be inserted");
			}
	
}
catch(Exception e)
{
			
}
%>
</body>
</html>
