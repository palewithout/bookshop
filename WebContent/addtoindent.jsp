
<%@ page language="java" import="java.util.Vector" contentType="text/html;charset=gb2312" pageEncoding="UTF-8"%>

<html>

	<head>

		<title>
			添加订单内容
			
		</title>

	</head>

	<body>
	<%

		

		 //获得图书编号 编号从隐藏按钮的值中获取 

            String bookid=(request.getParameter("number")); 

            //首先判断客户是否已经有一个订单 如果没有则创建一个 

            Vector order=new Vector(); 

            if(session.getAttribute("indent")!=null) 

            { 

                order=(Vector)session.getAttribute("indent"); 

            } 

            //如果是订单中没有的项目 则添加到订单中 

            if(!order.contains(bookid)) 

            { 

                order.addElement(bookid); 

                session.setAttribute("indent",order); 

            } 

			response.sendRedirect("http://localhost:8080/BookShopWeb/bookstore.jsp");

		%>

	</body>

</html>
