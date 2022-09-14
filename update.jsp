<%@ page import="java.sql.*"%> <%@ page import="java.io.*"%> <%! Connection
con=null; PreparedStatement pstmt1=null; //PreparedStatement pstmt2=null;
ResultSet rs=null; %>
<html>
  <body>
    <% try{ Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","dhiru","dhiru");
    pstmt1=con.prepareStatement("update student set name=?,m1=?,m2=?,m3=? where id=?");
    //pstmt2=con.prepareStatement("select * from student",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE"); 
    int sno=Integer.parseInt(request.getParameter("sno"));
    String name=request.getParameter("name"); 
    int m1=Integer.parseInt(request.getParameter("m1")); 
    int m2=Integer.parseInt(request.getParameter("m2")); 
    int m3=Integer.parseInt(request.getParameter("m3")); 
    pstmt1.setInt(5,sno);
    pstmt1.setString(1,name);
    pstmt1.setInt(2,m1); 
    pstmt1.setInt(3,m2);
    pstmt1.setInt(4,m3); 
    int i=pstmt1.executeUpdate(); 
    //out.print(i);
	if(i>0) {
    %>
    <jsp:forward page="show.jsp" />
    <% } else{ out.println("cannot be updated"); } } catch(Exception e) { } %>
  </body>
</html>
