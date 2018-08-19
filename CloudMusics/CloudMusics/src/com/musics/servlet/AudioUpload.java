package com.musics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.musics.dto.MusicsDto;
import com.musics.dto.MyMusicsDto;
import com.musics.service.MusicsSreviceImpl;
import com.musics.service.MyMusicsServiceImpl;
import com.musics.util.Mp3Info;

//若是上传一个文件，仅仅需要设置maxFileSize熟悉即可。
		//上传多个文件，可能需要设置maxRequestSize属性，设定一次上传数据的最大量。
		//上传过程中无论是单个文件超过maxFileSize值，或者上传总的数据量大于maxRequestSize值都会抛出IllegalStateException异常;
		//location属性，既是保存路径(在写入的时候，可以忽略路径设定)，又是上传过程中临时文件的保存路径，一旦执行Part.write方法之后，临时文件将被自动清除。
		//但Servlet 3.0规范同时也说明，不提供获取上传文件名的方法，尽管我们可以通过part.getHeader("content-disposition")方法间接获取得到。
@WebServlet("/audioupload")
@MultipartConfig(
		//location="D:\\MusicFile\\",//设置临时目录
		//fileSizeThreshold=1024*1024*500,//设置内存的缓存最大值(超过该大小进入临时目录缓存)
		maxFileSize=1024*1024*1000//设置单个文件的最大值
		//maxRequestSize=1024*1024*300//设置允许提交的表单数据的最大值
		)
public class AudioUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AudioUpload() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//根据指定的表单控件的name属性获取包含表单数据的Part(附件)对象
		Part part = request.getPart("musicfile");
		//获取控件标签名
		//System.out.println(part.getName());
		//获取上传文件的文件名
		//System.out.println(part.getSubmittedFileName());
		String uuid = UUID.randomUUID().toString();
		String fname = "D:\\MusicFile\\"+uuid+".mp3";
		//将数据保存到指定的目录下
		//System.out.println(fname);
		part.write(fname);
		Mp3Info mi = new Mp3Info(fname);
		String strs = mi.getContent();
		//System.out.println(mi.getContent());
		PrintWriter pw = response.getWriter();
		pw.print(strs);
		pw.flush();
		pw.close();
		String[] s = strs.split(",");
		MusicsDto music = new MusicsDto(0, s[0], s[1], s[2], 0, null, 0, null, uuid+".mp3");
		int x = MusicsSreviceImpl.addMusic(music);
		if(x != -1) {
			MyMusicsDto mm = new MyMusicsDto();
			mm.setMid(x);
			Cookie[] cs = request.getCookies();
			for (Cookie cookie : cs) {
				if("uid".equals(cookie.getName())) {
					mm.setUid(Integer.parseInt(cookie.getValue()));
					break;
				}
			}
			MyMusicsServiceImpl mmsi = new MyMusicsServiceImpl();
			mmsi.addMyMusics(mm);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
