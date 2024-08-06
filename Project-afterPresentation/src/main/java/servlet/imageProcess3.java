package servlet;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.awt.Rectangle;
import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/imageProcess3")
public class imageProcess3 extends HttpServlet {

		private static final long serialVersionUID = 1L;
		List<String> imagePaths;
		List<String> filenames;
		String productID;
//		String imgsPath;
		HttpServletResponse myResponse;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}


		protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			imagePaths = new ArrayList<>();
			filenames = new ArrayList<>();
			productID = request.getParameter("id");
			myResponse = response;
			
	        //多重檔案上傳
	        if(!request.getContentType().split(";")[0].equals("multipart/form-data")) {
	        	return;
	        }
	        
	        //拆分多重檔案
	        Collection<Part> parts = request.getParts();
	        System.out.println(parts);
	        for(Part part:parts) {
//	        	System.out.println(part);
	        	
//	        	FileProcess(part);
	        	if(part.getName().equals("fileUploader")) {
					String cd = part.getHeader("Content-Disposition");
					String[] cds = cd.split(";");
					String filename = cds[2].substring(cds[2].indexOf("=")+1).substring(cds[2].lastIndexOf("//")+1).replace("/", "").replace("\"", "");
					
					String imgsPath = "\"<img src='images/"+filename+"' class='file-preview-image' draggable='true' alt='"+filename+"'>\"";
					filenames.add("\""+filename+"\"");
//					System.out.println(String.join(",", filenames));
					imagePaths.add(imgsPath);
					
					// 取得專案路徑
					String realPath=getServletContext().getRealPath("images");
					// 先建立目錄
					File dir=new File(realPath);
					if(!dir.exists())
						dir.mkdir();
					// 設定儲存路徑
					String path=realPath+File.separator+filename;
					System.out.println("file path: "+path);
					
			        part.write(path);}
	        }
	        
	        
	           
	        //String res = convertToJson(uploadedFiles);
	        String makeJson = "{\"initialPreview\":["+String.join(",", imagePaths)+"],"
	        		+ " \"fileNames\":["+String.join(",", filenames)+"],"
//	        		+ " \"initialPreviewConfig\":[{\r\n"
//	        		+ "      \"caption\": \"223.jpg\",\r\n"
//	        		+ "      \"width\": \"120px\",\r\n"
//	        		+ "      \"url\": \"/delete-url\",\r\n"
//	        		+ "      \"key\": 1,\r\n"
//	        		+ "      \"extra\": { \"id\": 123 }\r\n"
//	        		+ "    }], \"initialPreviewThumbTags\":[{ \"key\": 1, \"value\": \"Tag 1\" },\r\n"
//	        		+ "    { \"key\": 2, \"value\": \"Tag 2\" }],"
	        		+ " \"append\": true }";
//	        System.out.println(makeJson.substring(212));
	        response.getWriter().write(makeJson);
//	        response.getWriter().write("{}");
	    }
		

		
		private String convertToJson(List<String> files) {
	        StringBuilder jsonResult = new StringBuilder("{ \"uploadedFiles\": [");
	        for (String file : files) {
	            jsonResult.append("\"").append(file).append("\",");
	        }
	        if (files.size() > 0) {
	            jsonResult.deleteCharAt(jsonResult.length() - 1); // 移除最後一個逗號
	        }
	        jsonResult.append("] }");
	        return jsonResult.toString();
	    }

	}