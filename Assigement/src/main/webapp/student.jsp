<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
    int id=Integer.parseInt(request.getParameter("no"));
    String name=request.getParameter("name");
    String dob=request.getParameter("Ddate");
    String doj=request.getParameter("Djdate");
    String action=request.getParameter("action");
    try
    {
    	ResultSet rs;
    	PreparedStatement ps;
    	int x;
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/assigment","root","");
    
  %>
<%
  switch(action)
  { 
  
  case "add":
	  try{
	ps=conn.prepareStatement("insert into student(id,name,DOB,DOJ) values(?,?,?,?);");
	ps.setInt(1,id);
	ps.setString(2,name);
	ps.setString(3,dob);
	ps.setString(4,doj);
     x=ps.executeUpdate();
     if(x>0)
 	  {
       response.sendRedirect("display.jsp?a='record is inserted'");
      }
	 else
	    {
	     response.sendRedirect("display.jsp?a='record is not inserted'");
	    }
	  }
	  catch(Exception e)
	  {
		  System.out.println(e);
	  }
	  break;
	  
  case "update":
	  try{
			ps=conn.prepareStatement("update student set name=?,DOB=?,DOJ=? where id=?");
			
			ps.setString(1,name);
			ps.setString(2,dob);
			ps.setString(3,doj);
			ps.setInt(4,id);
		     x=ps.executeUpdate();
		     if(x>0)
		 	  {
		       response.sendRedirect("display.jsp?a='record is updated'");
		      }
			 else
			    {
			     response.sendRedirect("display.jsp?a='record is not updated'");
			    }
			  }
			  catch(Exception e)
			  {
				  System.out.println(e);
			  }
	  break;
	  
  case "delete":
	  try{
	  ps=conn.prepareStatement("delete from student where id = ?");
	    ps.setInt(1,id);
	    x=ps.executeUpdate();
	    if(x>0)
    	{
          response.sendRedirect("display.jsp?a='record is delated'");
        }
	    else
	    {
	     response.sendRedirect("display.jsp?a='record is not delated'");
	    }
	  }
	  catch(Exception e)
	  {
		  System.out.println(e);
	  }
	  break;
	  
	  
  case "details":
	  try{
		  ps=conn.prepareStatement("select * from student");
		   
		    rs=ps.executeQuery();
		    while(rs.next())
        	   {
        		  %>
                     <table border="1px">
                      <tr>
                          <td><%=rs.getInt("id") %></td>
                          <td><%=rs.getString("name") %></td> 
                          <td><%=rs.getString("DOB") %></td> 
                          <td><%=rs.getString("DOJ") %></td> 
                          
                      </tr>
                      </table>
                         
        		 <%
        	   }}
		    catch(Exception e)
		    {
		    	System.out.println(e);
		    }
		    
	  break;
	  
	  
  case "idsearch":
	  try{
		  ps=conn.prepareStatement("select * from student where id=?");
		    ps.setInt(1,id);
		    rs=ps.executeQuery();
		    while(rs.next())
        	   {
        		  %>
        		  <center>
                      <table border="1px">
                      <tr>
                          <td><%=rs.getInt("id") %></td>
                          <td><%=rs.getString("name") %></td> 
                          <td><%=rs.getString("DOB") %></td> 
                          <td><%=rs.getString("DOJ") %></td> 
                          
                      </tr>
                      </table>
                      </center>
                         
        		 <%
        	   }}
		    catch(Exception e)
		    {
		    	System.out.println(e);
		    }
	  break;
	  
	  
  default:
	  System.out.println("you are not enter proper record");
  }
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }

    
%>


</body>
</html>