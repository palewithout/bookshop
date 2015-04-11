<%@ page language="java" import="java.util.Vector" contentType="text/html;charset=gb2312" pageEncoding="UTF-8"%>

<html>

	<head>

		<title>
			删除订单内容
			
		</title>

	</head>

	<body>
	<%

		

		 //获得想删除图书编号 编号从隐藏按钮的值中获取 

            String bookid=(request.getParameter("number")); 

            //获得定单

            Vector order=(Vector)session.getAttribute("indent");

           

            //删除指定项目 

            order.removeElement(bookid);

            session.setAttribute("indent",order);
            
			response.sendRedirect("http://localhost:8080/BookShopWeb/checkout.jsp");

		%>

	</body>

</html>
