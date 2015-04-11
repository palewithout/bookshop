
<%@ page language="java" pageEncoding="UTF-8"%>

<html>

	<head>

		<title>
			保存购书信息
		</title>

	</head>

	<body>

		<%@ page import="java.util.Vector,java.sql.*"%>

		<% 

            // 以集合的形式获得订单 

            Vector orderlist=(Vector)session.getAttribute("indent"); 

            //构造查询字符串 

            String instr="("; 

            //如果客户选择了欲订图书 则显示详细清单 

            if(orderlist!=null && (orderlist.size()>0)){ 

                for(int i=0;i<orderlist.size();i++){ 

                      instr+=orderlist.elementAt(i)+","; 

                } 

            instr+=")"; 

            String name=(request.getParameter("cName")); 

            String email=(request.getParameter("cEmail")); 

            //加载驱动程序 执行查询 

                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                 Connection cn=DriverManager.getConnection("jdbc:odbc:bookDSN"); 

              String str="INSERT INTO user(username,mail,instr) VALUES('"+name+"','"+email+"','"+instr+"')"; 

              Statement st=cn.createStatement(); 

              st.executeUpdate(str); 

              out.print("<P><center><h1>   已经成功存入数据          <h1></center>"); 
                                       

          } 

       %>

		<p></p>

		 <center><a href="bookstore.jsp" title=" 返回主页">   返回主页    </a></center> 
                                       

     </body> 

     </html> 

	