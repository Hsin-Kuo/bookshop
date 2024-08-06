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
		<script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js">
            </script>
            <style>
            div{
            position: relative;
            text-align: center;
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
			
			 <textarea id="editor" name="editor">This is some sample content.</textarea>
			 <input type="submit">
			 </form>
		 </div>
            <script>
                    ClassicEditor
                            .create(document.querySelector( 
                                '#editor'),{
                            	toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote', '|',  'insertTable' ],
                                heading: {
                                    options: [
                                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' }
                                    ]
                                }
                            })
                            .then(editor=>{
                                   console.log(editor);
                            })
                            .catch(error=>{
                                   console.error(error);
                            });
            </script>
	</body>
</html>