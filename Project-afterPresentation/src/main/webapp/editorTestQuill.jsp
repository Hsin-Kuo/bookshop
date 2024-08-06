<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
            <style>
            div{
            position: relative;
            }
            form{
            position: relative;
            left: 50%;
           	transform: translateX(-50%);
           	margin-top: 50px;
            }
            </style>
            
		<title>Insert title here</title>
		
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");
		%>
		<div>
			<form action="getText.jsp" method="post" style="width: 50%; height: 300px">
			
			 <div id="editor" style="width: 100%; height: 300px"><p>This is some sample content.<p></div>
			 <textarea id="hide" name="text" rows="5" cols="100"></textarea> 
			 <!-- <input id="hide" name="text"> -->
			 <input type="submit" onclick="beforeSubmit()">
			 </form>
		 </div>
		 <div id="show">???
		 </div>
		 <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
            <script>
            
            	let toolbaroptions = [
            		["bold", "italic", "underline", "strike"],
            		[{header:[1,2,3,4,5,6,false]}],
            		[{list:"ordered"}, {list:"bullet"}],
            		[{indent: "+1"}, {indent:"-1"}],
            		[{align:[]}],
            		[{size:["small", "large", "huge", false]}],
            		["image", "link", "video", 'formula'],
            	]
			  var quill = new Quill('#editor', {
			    theme: 'snow',
			    placeholder: '請輸入內文內容',
			    modules:{
			    	toolbar: {toolbaroptions},
			    }
			    
			  });
			  
			  
			  var hide = document.getElementById("hide");
			  var editor = document.getElementById("insideEditor");
	            function beforeSubmit(){
	            	//var text = quill.getContents();
	            	var text = quill.root.innerHTML
	            	hide.value = text
	            }
	            
	            $("#hide").keyup(function(){
	            	var text = quill.root.innerHTML
	            	$("#show").innerHTML = text
	            })
			</script>
	</body>
</html>