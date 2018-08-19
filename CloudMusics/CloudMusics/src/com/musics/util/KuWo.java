package com.musics.util;

import java.io.IOException;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class KuWo {
	
	public static void getKuWoMusicList(String name,List<String[]> list) {
		getGson(name,list);
		getList(list);
		getMp3(list);
	}
	
	/**
	 * 获取string[5]----mp3播放地址
	 * @param list
	 */
	private static void getMp3(List<String[]> list) {
		for (String[] strings : list) {
			String url = "http://antiserver.kuwo.cn/anti.s?type=convert_url&rid="+strings[3]+"&format=aac&response=url";
			OkHttpClient okHttpClient = new OkHttpClient();
			Request request = new Request.Builder()
			    .url(url)
			    .build();
			Call call = okHttpClient.newCall(request);
			try {
			    Response response = call.execute();
			    String body = response.body().string();
			    strings[5] = body;
			} catch (IOException e) {
			    e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 获取String[0]-----音乐名称
	 * 获取String[1]-----歌手名称
	 * 获取String[2]-----专辑名称
	 * 获取String[3]-----音乐在KuWo的Id
	 * @param list
	 */
	private static void getList(List<String[]> list) {
		String url = "http://player.kuwo.cn/webmusic/st/getNewMuiseByRid?rid=";
		for (String[] ss : list) {
			String urll = url+ss[3];
			OkHttpClient okHttpClient = new OkHttpClient();
			Request request = new Request.Builder()
			    .url(urll)
			    .build();
			Call call = okHttpClient.newCall(request);
			try {
			    Response response = call.execute();
			    String body = response.body().string();
			    body = DealStrSub.getXml(body);
			    ss[4] = body;
			} catch (IOException e) {
			    e.printStackTrace();
			}
		}
	}
	
	/**
	 * 获取String[4]-----音乐图片地址
	 * @param list
	 */
	private static void getGson(String str,List<String[]> list) {
		String url = "http://search.kuwo.cn/r.s?all="+str+"&ft=music&itemset=web_2013&client=kt&pn=0&rn=20&rformat=json&encoding=utf8";
		OkHttpClient okHttpClient = new OkHttpClient();
		Request request = new Request.Builder()
		    .url(url)
		    .build();
		Call call = okHttpClient.newCall(request);
		try {
		    Response response = call.execute();
		    String body = response.body().string();
		    JSONObject jo = JSON.parseObject(body);
		    body = jo.get("abslist").toString();
		    JSONArray ja = JSON.parseArray(body);
		    String[] ss = null;
		    for (Object object : ja) {
				jo = JSON.parseObject(object.toString());
				ss = new String[6];
				ss[0] = jo.get("SONGNAME").toString();
				ss[1] = jo.get("ARTIST").toString();
				ss[2] = jo.get("ALBUM").toString();
				ss[3] = jo.get("MUSICRID").toString();
				list.add(ss);
			}
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}
}
