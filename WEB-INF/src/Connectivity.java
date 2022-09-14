import java.sql.*;
class Connectivity
{
	public Connection connect()
	{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","khushi","khushi");
		}
		catch(Exception e)
		{
		}
		return null;
	}
}