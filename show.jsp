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
<center><h2 class="head">STUDENT RECORD</h2></center>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","dhiru","dhiru");
	pstmt=con.prepareStatement("select * from student",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=pstmt.executeQuery();
%>
	<div>
	<center>
	<table class="show">
	<form action="insert.jsp" method="post">
	<thead><tr class="table-head"><th colspan="7" align="center"">ADD RECORD</th></tr></thead>
	<tr><td><input  type="text" placeholder="Enter Student No" name="id" class="con" required="required"></td>
	<td><input required="required" type="text" placeholder="Enter Student Name" name="name" class="con"></td>
	<td><input required="required" type="text" placeholder="Enter Student Mark 1" name="m1" class="con"></td>
	<td><input required="required" type="text" placeholder="Enter Student Mark 2" name="m2" class="con"></td>
	<td><input required="required" type="text" placeholder="Enter Student Mark 3" name="m3" class="con"></td>
	<td colspan="2"><input type="submit" value="INSERT" class="btn"></td></tr>
	</form>
	<thead><tr class="table-head"><th colspan="7" align="center">MANAGE RECORD</th></tr></thead>
	<tr class="table-middle"><th>ID</th><th>NAME</th><th>MARK 1</th><th>MARK 2</th><th>MARK 3</th><th colspan="2"></th></tr>
<%
	while(rs.next())
	{
%>
	<tr class="info"><td><%= rs.getString(1) %></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
	<td><%= rs.getString(5) %></td>
	<td><a href="delete.jsp?delete=<%=rs.getString(1)%>" class="link"><input type="button" value="DELETE" class="btn"></a></td>
	<td><a href="edit.jsp?edit=<%=rs.getString(1)%>" class="link"><input type="button" value="EDIT" class="btn"></a></td>
	</tr>
	<%
		
	}
}
catch(Exception e)
{
			
}
%>
</table>
</center>
</div>
</body>
</html>
