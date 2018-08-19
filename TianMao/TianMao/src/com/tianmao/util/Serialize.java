package com.tianmao.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class Serialize {
	
	public static byte[] serialize(Object object) {
		try {
			ByteArrayOutputStream bai =  new ByteArrayOutputStream();
			ObjectOutputStream obi = new ObjectOutputStream(bai);
			obi.writeObject(object);
			byte[] byt = bai.toByteArray();
			return byt;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Object unserialize(byte[] byt) {
		try {
			ByteArrayInputStream bis = new ByteArrayInputStream(byt);
			ObjectInputStream oii = new ObjectInputStream(bis);
			Object obj = oii.readObject();
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
