
<%@ page language="java" pageEncoding="UTF-8"%>







<html> 

     <head> 

            <title>填写订书信息</title> 

     </head> 
     
     <SCRIPT>
<!--
function check(){
	var tt1=document.all.cName.value;
	var tt2=document.all.cEmail.value;
	if(tt1 == "") {
		alert("请输入用户名！");
		document.all.cName.focus();
		return false;
	}
	if(tt2 == "") {
		alert("请输入密码！");
		document.all.cEmail.focus();
		return false;
	}
}

//-->
</SCRIPT>
     
     

     <body> 

     <center> 

     <h1>请如实填写如下购书信息</h1> 

     <hr> 

     <form name="buyform" action="writetodatabase.jsp" method="POST"> 

     <b>姓名 </b> 

     <input type="text" name="cName" SIZE="20" value="请在此输入姓名"> 

     <B>Email 地址 </B><input type="text" name="cEmail" SIZE="20" value="请在此输入Email 地址"> 

     <BR><P> 

     <input type="submit" name="deal" value="购书"> 

     </form> 

     </center> 

     <hr> 

     <center> 

     <font   size="+2"> 

     <table border="0" width="100%" > 

     <tr> 

     <td align="center"> 

     <a href="bookstore.jsp" title="  返回主页     ">    回到主页        </a> 
                                  

     </td> 

     <td align="center"> 

     <a href="checkout.jsp" title="  查看订单      ">   查看订单       </a> 
                                  

     </td></tr> 

     </table> </font></center> 

     </body> 

     </html> 