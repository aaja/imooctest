<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
    <%@page import="dao.ItemsDAO" %>
    <%@page import="entity.Items" %>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table width="1000" height="60" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<%
			ItemsDAO itemsDao = new ItemsDAO(); 
			Items items = itemsDao.getItem(Integer.parseInt(request.getParameter("id")));
			out.println("这里执行了一次");
			if(items != null)
			{
		%>
			<div>
				<dl>
					<dt>
						<a href="details.jsp?<%=items.getId()%>">
						<img alt="" src="images/<%= items.getPicture()%>" width="120" height="90"></a>
					</dt>
					<dd class="dd_name"><%=items.getName() %></dd>
					<dd class="dd_city"> 产地：<%=items.getCity() %>&nbsp;&nbsp;价格：￥<%=items.getPrice() %></dd>
				</dl>
				
			</div>
			<%
			}
			%>
		</td>
	</tr>
</table>
</body>
</html>