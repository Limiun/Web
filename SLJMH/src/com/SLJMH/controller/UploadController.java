package com.SLJMH.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.Files;
import com.SLJMH.service.FileService;
import com.SLJMH.utils.FileUploadUtils;

@WebServlet(value = "/UploadServlet")
public class UploadController extends HttpServlet {

	private FileService   fileServiceImpl;
	private ApplicationContext applicationContext;
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		fileServiceImpl = (FileService) applicationContext.getBean("FileServiceImpl");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		if("add".equals(request.getParameter("file"))){
			Map<String, String[]> map = new HashMap<String, String[]>();
			// 1.创建DiskFileItemFactory
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2.创建ServletFileUpload
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 设置上传文件中文名称乱码
			upload.setHeaderEncoding("utf-8");
			// 3.得到所有的FileItem
			try {
				List<FileItem> items = upload.parseRequest(request);
				for (FileItem item : items) {
					Files f= new Files();
					if (item.isFormField()) {
						// 不是上传组件
						System.out.print(new String(item.getString("UTF-8")));
						
						if ("filealbumName".equals(item.getFieldName())) {
	                        f.setFilealbumName(new String(item.getString("UTF-8")));
	                    } else if ("fileuserName".equals(item.getFieldName())) {
	                        f.setFileuserName(new String(item.getString("UTF-8")));
	                    }
					}
					
					
					if (item.isFormField()) {
						// 不是上传组件
						
						
						
					} else {
						// 是上传组件
						// 得到上传文件名称
						String filename = item.getName();
						filename = FileUploadUtils.getRealName(filename);
						map.put("realname", new String[] { filename }); // 封装上传文件真实名称
						// 得到随机名称
						String uuidname = FileUploadUtils.getUUIDFileName(filename);
						map.put("uuidname", new String[] { uuidname });// 封装上传文件随机名称
						// 得到随机目录
						String randomDirectory = FileUploadUtils.getRandomDirectory(filename);
						String uploadPath = this.getServletContext().getRealPath("/upload").replace("\\", "/");
						File parentDirectory = new File(uploadPath,randomDirectory);
						if (!parentDirectory.exists()) {
							parentDirectory.mkdirs();
						}
						String Path = request.getContextPath().toString()+ "/upload";
						
						map.put("savepath", new String[] { uploadPath+ randomDirectory });// 封装上传文件保存路径
						map.put("path", new String[] { Path + randomDirectory });
						InputStream in = item.getInputStream();
						FileOutputStream io = new FileOutputStream(new File(parentDirectory, uuidname));
						IOUtils.copy(in, io);
						in.close();
						io.close();
						item.delete();
						
						//保存文件属性到数据库
						String yxy="yxy";
						String t="t";
						f.setFileName(filename);
						f.setFileUuuName(uuidname);
					    f.setFilePath(uploadPath+ randomDirectory);
						f.setFileUrl("/upload" + randomDirectory+"/"+uuidname);
						f.setFileuserName(yxy);
						 f.setFilealbumName(t);
						if("pic".equals(request.getParameter("type"))){
							f.setFileType("pic");
						}else{
							f.setFileType("blog");
						PrintWriter out = response.getWriter();  
						String path = request.getContextPath();
						String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
						// CKEditor提交的很重要的一个参数  
				        String callback = request.getParameter("CKEditorFuncNum"); 
						out.println("<script type=\"text/javascript\">");    
						out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" +basePath+ "upload" + randomDirectory+"/"+uuidname + "','')");    
						out.println("</script>");  
						}
				
						fileServiceImpl.save(f); 
					}
					
				}//for
				
		      	} catch (FileUploadException e) {
				// TODO Auto-generated catch block
		     		e.printStackTrace();
			    }
			
			  
		}//if  add
		
		if("list".equals(request.getParameter("file"))){
			 
			 List<Files>  List =fileServiceImpl.findAll("Files");
			 request.getSession().setAttribute("Files", List);
			 
			if("blog".equals(request.getParameter("type"))){
				 response.sendRedirect("manager/listpic.jsp");
				 
				 
				 
			}else{
				 response.sendRedirect("manager/droppic.jsp");
			}
			 
		}
		if("delete".equals(request.getParameter("file"))){
			 Files fs =fileServiceImpl.findById(Integer.parseInt(request.getParameter("fileId")));
			 fileServiceImpl.deleteFile(fs.getFilePath(),fs.getFileUuuName());
			 fileServiceImpl.delete(fs);
			 List<Files>  List =fileServiceImpl.findAll("Files");
			 request.getSession().setAttribute("Files", List);
			 response.sendRedirect("manager/droppic.jsp");
		}
		
		

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
