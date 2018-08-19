package com.tianmao.util;

import java.io.PrintWriter;

public class Ut {
	public static void back(PrintWriter p,String s) {
		p.print(s);
		p.flush();
		p.close();
	}
}
