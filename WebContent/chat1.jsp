<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@include file="navigation.jsp" %>
     <%@page import="java.util.*" %>
  <%@page import="java.sql.*" %>
    <%
    if(session.getAttribute("sess_id")==null)
    {
    	 response.sendRedirect("user_login.jsp");
    	}
    else
    {
    int rcv_id=	(int)session.getAttribute("sess_id");
  Statement st=null,st1=null;
 Connection con=null;
 ResultSet rs1;
 ResultSet rs2;
 ResultSet rs3,rs4;
 int temp=0; 
 try{	 
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
 	  st=con.createStatement();
 	  rs1=st.executeQuery("select * from new_user1 where user_id="+rcv_id);
 	while(rs1.next())
 	 {
 	  temp=rs1.getInt(13);
 	 }
 %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="chat1_style.css" type="text/css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
</head>
<body>
<div class="container">
<h3 class=" text-center">Messaging</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>CLASS ROOM</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
          <div class="inbox_chat">
         <% 
          st=con.createStatement();
     	  rs3=st.executeQuery("select * from new_user1 where user_course="+temp+" and user_category="+2);
     	 st1=con.createStatement();	
     	 while(rs3.next())
     	 {
          int c=1;
        %>
              <div class="t">
              <div class="chat_people">
              
                 <div class="chat_img">
                 <% 
                 out.print(c);
                  int id=rs3.getInt(1);
                 out.print(id);
                 rs4=st1.executeQuery("select * from user_images where user_id="+id);
             	 if(rs4.next())
             	 {
             		 c++;
             		String imgDataBase64=null;
             		imgDataBase64=new String(Base64.getEncoder().encode(rs4.getBytes(2)));
               out.print("<img src='data:image/jpeg;base64,"+imgDataBase64+"' style='border-radius:50%;'/>");
             	 %>
                 </div>
                <div class="chat_ib">
                  <h5><% out.print(rs3.getString(3)+"  "+rs3.getString(4));   %><span class="chat_date">Dec 25</span></h5>
                  <p><% out.print("  "+rs4.getString(3)+"  ");   %></p>
                </div>
              </div>
            </div>
            <%
         }}
       %> 
        <% 
          st=con.createStatement();
     	  rs3=st.executeQuery("select * from new_user1 where user_course="+temp);
     	 st1=con.createStatement();	
     	 while(rs3.next())
     	 {
     		 int c=1;
       if(rs3.getInt(15)!=2){
          %>
            <div class="chat_list">
              <div class="chat_people">          
                 <div class="chat_img">
                 <% 
                 out.print(c);
                 int id=rs3.getInt(1);
                 out.print(id);
                 rs4=st1.executeQuery("select * from user_images where user_id="+id);
             	 if(rs4.next())
             	 {
             		
             		 c++;
             		String imgDataBase64=null;
             		imgDataBase64=new String(Base64.getEncoder().encode(rs4.getBytes(2)));         
                 out.print("<img src='data:image/jpeg;base64,"+imgDataBase64+"' style='border-radius:50%;'/>");
             	 }
                 %>
                 </div>
                <div class="chat_ib">
                  <h5><% out.print(rs3.getString(3)+"  "+rs3.getString(4));   %><span class="chat_date">Dec 25</span></h5>
                  <p><% out.print("  "+rs4.getString(3)+"  ");   %></p>
                </div>
              </div>
            </div>
            <%
         }
     	 }
         %>  
            
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history">
<%  	
st=con.createStatement(); 
 	rs2=st.executeQuery("select * from user_chat where user_teacher="+temp);
 	while(rs2.next())
 	{
 		if(rs2.getInt(1)==rcv_id)
 		{
 		%>          
			<div class="outgoing_msg">
              <div class="sent_msg">
              <span class="time_date"> <% out.print(rs2.getString(5)+"  "+rs2.getString(6));   %></span>
                <p><% out.print(rs2.getString(3)); %></p>
                <span class="time_date"><% out.print(rs2.getString(4)); %></span>
                 </div>
            </div>
            <% }
 		if(rs2.getInt(1)!=rcv_id)
 		{
 		%>
            
            <div class="incoming_msg">
          <!--     <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div> -->
              <div class="incoming_msg_img"> <img src="img.jpg" alt="sunil"> </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                <span class="time_date"> <% out.print(rs2.getString(5)+"  "+rs2.getString(6));   %></span>
                  <p> <% out.print(rs2.getString(3)); %>  </p>
                  <span class="time_date"><% out.print(rs2.getString(4)); %></span></div>
              </div>
            </div>
        <%
        }
        }
        %>    
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
            <form name="chat" id="chat" method="post" action="chat_insert.jsp">
              <input type="text" name="user_msg" class="write_msg" placeholder="Type a message" />
              </form>
              <button form="chat" class="msg_send_btn" type="submit" value="submit" ><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
          
        </div>
      </div>
     </div></div>
    </body>
    </html>
<%
con.close();
	st.cancel();	
}catch(Exception e)
{
	 out.write(e.getMessage());
}
    }    
%>