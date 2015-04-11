
<%@ page language="java" import="java.sql.*" contentType="text/html;charset=gb2312" pageEncoding="UTF-8"%>

<html>

	<head>

		<title>
			网上书店
		</title>

	</head>

	<body>

		

		<table border="0" width="100%">

			<tr>

				<td>

					<font size="+3">

						 阿当网上书店

					</font>

				</td>

				<td></td>

				<td align="center">

					<a href="checkout.jsp" title="查看订单，确定购买 ">查看订单</a>
					 

				</td>

			</tr>

		</table>

		<hr>

		<center>

			<form name="shoppingForm" action="getdata.jsp" method="POST">

				<b>
					 图书查询
				</b>

				<input type="text" name="queryStr" SIZE="20" value="在此输入要查询的图书">

				<input type="submit" name="query" value="查询">

			</form>

		</center>

		<hr>

		

		<FONT size="+2" color="#66ccff">

			 所有图书
			<BR>

		</FONT>
		
		<%Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

			Connection cn = DriverManager.getConnection("jdbc:odbc:bookDSN");

			String para = (request.getParameter("queryStr"));

			String str = "SELECT * FROM book ";

			PreparedStatement ps = cn.prepareStatement(str);

			ResultSet rs = ps.executeQuery();

			int i = 0;

			while (rs.next()) {

				i++;

				out.print("<form name='querydata' action='addtoindent.jsp' method='POST'>");

				out.print("<table border='0' cellpadding='0' width='100%'");

				out.print("<tr><td colspan='2'><font size='+2'>");

				out.print(i);

				out.print(".《");

				out.print(rs.getString("bookName") + "》</font></td></tr>");

				out.print("<tr><td colspan='3'>");

				out.print(rs.getString("bookNeirong") + "</td><td>");

				out.print("<input type='hidden' name='number' value='");

				out.print(rs.getString("number")+ "'></td><tr><td> </td><td align='right'>");

				out.print(rs.getString("jiage") + "元/册 ,  "+ rs.getString("chubanshe"));

				out.print("<input type='submit' name='recommend1' value='添加到订单'></td></tr>");

				out.print("</table></form>");

			}

			ps.close();

			cn.close();
		
		%>
		<FORM name="shoppingForm1" action="addtoindent.jsp" method="POST"></FORM><font size="-1">

			<center>

				 Copyright to Adam Net Bookstore co. 2001/4/1

			</center>

		</font>
	</body>
</html>
