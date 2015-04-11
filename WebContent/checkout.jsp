
<%@ page language="java" pageEncoding="UTF-8"%>

<html> 

<head> 

       <title>查看订单</title> 

</head> 

<body> 

<center> 

<h2>你欲订购的图书信息如下</h2> 

<hr> 

<%@ page import="java.util.Vector,java.sql.*" %> 

<% 

       //获得订单 

       Vector orderlist=(Vector)session.getValue("indent"); 

       //构造查询字符串 

       String instr="("; 

       //如果客户选择了欲订图书 则显示详细清单 

       if(orderlist!=null && (orderlist.size()>0)){ 

            for(int i=0;i<orderlist.size();i++){ 

                  instr+=orderlist.elementAt(i)+","; 

            } 

            instr+=")"; 

       //加载驱动程序 执行查询 

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 

            Connection cn=DriverManager.getConnection("jdbc:odbc:bookDSN"); 

            String str="SELECT * FROM book WHERE number IN "+instr; 

            PreparedStatement ps=cn.prepareStatement(str); 

            ResultSet rs=ps.executeQuery(); 

            int i=0; 

       //输出客户欲订书清单 

            while(rs.next()){ 

                  i++; 

                  out.print("<form name='querydata' action='deletefromindent.jsp' method='POST'>"); 

                  out.print("<table border='0' cellpadding='0' width='100%'"); 

                  out.print("<tr><td colspan='2'><font size='+2'>"); 

                  out.print(i); 

                  out.print("  ,《   "); 

                  out.print(rs.getString("bookName")+"  》    </font></td></tr>"); 

                  out.print("<tr><td colspan='3'>"); 

                  out.print(rs.getString("bookNeirong")+"</td><td>"); 

                  out.print("<input type='hidden' name='number' value='");
                  
                  out.print(rs.getString("number")+"'></td><tr><td> </td><td align='right'>"); 

                  out.print(rs.getString("jiage")+" 元/册   "+rs.getString("chubanshe")); 

                  out.print("<input type='submit' name='recommend1' value='删除'></td></tr>"); 

                  out.print("</table></form>"); 

                  } 

                  ps.close(); 

                  cn.close(); 

             } 

        %> 

      </center> 

      <hr> 

      <font   size="+2"> 

      <table border="0" width="100%" > 

      <tr> 

      <td align="center"> 

      <a href="bookstore.jsp" title="    返回主页       ">  回到主页        </a> 
                                       

      </td> 

      <td align="center"> 

      <a href="decideorder.jsp" title="        我要购买图书        "> 订购图书         </a> 
                                         

      </td></tr> 

      </table> </font> 

      </body></html> 
