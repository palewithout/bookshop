<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<html>

	<head>
		<title>
			图书查询结果
		</title>
	</head>

	<body>



		<%@ page contentType="text/html;charset=gb2312"%>

		<font size="+3">
			查询结果
		</font>--------你需要查询的是书名包含“<%=request.getParameter("queryStr")%>”的图书

		<hr>
		<p>

			<%Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

			Connection cn = DriverManager.getConnection("jdbc:odbc:bookDSN");

			String para = (request.getParameter("queryStr"));

			String str = "SELECT * FROM book WHERE bookName like '%" + para + "%'";

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
		<hr>

		<font size="+2">

			<table border="0" width="100%">

				<tr>

					<td align="center">

						<a href="bookstore.jsp" title="返回主页 ">
							回到主页
						</a>


					</td>

					<td align="center">

						<a href="checkout.jsp" title="查看订单确定购买 ">
							查看订单
						</a>



					</td>
				</tr>

			</table>

		</font>
	</body>
</html>



