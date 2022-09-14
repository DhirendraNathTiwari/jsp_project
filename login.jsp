<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%! Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
%>
<html>
<head>
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","dhiru","dhiru");
	pstmt=con.prepareStatement("select * from login where username=?");
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	pstmt.setString(1,user);
	rs=pstmt.executeQuery();
	while(rs.next())
	{
		String name=rs.getString(1);
		String password=rs.getString(2);
		if(user.equals(name) && pass.equals(password)){ %>
			<jsp:forward page="show.jsp"/>
			
			<% }
			//out.println("<h2>Welcome "+user+"<br/>To contine click <a href=x.html>here</a></h2>");
		else
			out.println("<h2><center>Invalid User</h2>");
	}
}
catch(Exception e)
{
			
}
%>
</body>
</html>
