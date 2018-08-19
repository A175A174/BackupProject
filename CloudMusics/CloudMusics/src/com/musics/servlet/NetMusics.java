package com.musics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.musics.util.KuWo;

@WebServlet("/netmusics")
public class NetMusics extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public NetMusics() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		List<String[]> list = new ArrayList<String[]>();
		KuWo.getKuWoMusicList(name, list);
		JSONArray js = JSONArray.parseArray(JSON.toJSONString(list));
		PrintWriter pw = response.getWriter();
		pw.println(js);
		pw.flush();
		pw.close();
		//System.out.println(js);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
