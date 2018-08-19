package com.musics.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/audiodownload")
public class AudioDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AudioDownload() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = request.getParameter("address");
		String name = request.getParameter("name")+".mp3";
		//System.out.println("D:\\MusicFile\\"+address);
		
		//设置响应头，以附件形式响应,传递文件名(中文使用URLEncoder编码)
		response.setHeader("content-disposition", "attchment;filename="+URLEncoder.encode(name, "UTF-8"));
		response.setContentType("application/x-msdownload");
		
		//获取要下载的文件
		File file = new File("D:\\MusicFile",address);
		//获取目标文件输入流
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		//获取下载对象输出流
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		byte[] bytes = new byte[1024];
		int len = 0;
		while((len = bis.read(bytes))!= -1) {
			bos.write(bytes, 0, len);
		}
		bis.close();
		bos.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
