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
<div class="box1">
<%
try{
	//out.println("aaa");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","dhiru","dhiru");
	//out.println("aaa");
	pstmt=con.prepareStatement("select name,m1,m2,m3 from student where id=?");
	//out.println("aaa");
	int id=Integer.parseInt(request.getParameter("edit"));
	pstmt.setInt(1,id);
	//out.println("aaa");
	rs=pstmt.executeQuery();
	//out.println("aaa");
	while(rs.next())
	{
		String name=rs.getString(1);
		int m1=rs.getInt(2);
		int m2=rs.getInt(3);
		int m3=rs.getInt(4);
%>
		<center>
		<form action="update.jsp" method="post"><div class="insert">
		<table>
		<tr class="info"><td>Enter the student no: </td>
		<td><input type="text" name="sno" value="<%=id%>" class="con1"></td></tr>
		<tr class="info"><td>Enter the name: </td>
		<td><input type="text" name="name" value="<%=name%>" class="con1"></td></tr>
		<tr class="info"><td>Enter the mark 1: </td>
		<td><input type="text" name="m1" value="<%=m1%>" class="con1"></td></tr>
		<tr class="info"><td>Enter the mark 2: </td>
		<td><input type="text" name="m2" value="<%=m2%>" class="con1"></td></tr>
		<tr class="info"><td>Enter the mark 3: </td>
		<td><input type="text" name="m3" value="<%=m3%>" class="con1"></td></tr>
		<tr colspan="2"><td><input type="submit" value="MODIFY" id="btn"></td></tr>
		</table>
		</form>
		</center>
		<%
	}
}
catch(Exception e)
{
			
}
%>
</div>
</body>
</html>
