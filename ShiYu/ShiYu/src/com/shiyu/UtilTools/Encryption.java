package com.shiyu.UtilTools;

import java.security.MessageDigest;

/**
 * 签名加密工具
 */
public class Encryption {
	/***
	 * MD5加密 生成32位md5码 速度比较快 性能高 安全强度比sha1要低
	 * 
	 * @param inStr 待加密字符串
	 * @return 返回32位md5码
	 */
	public static String md5EncodeSignature(String inStr) throws Exception {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

		byte[] byteArray = inStr.getBytes("UTF-8");
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}

	/***
	 * SHA加密 生成40位SHA码 加密速度比md5慢 性能比md5低 安全强度比md5高
	 * 
	 * @param inStr 待加密字符串
	 * @return 返回40位SHA码
	 */
	public static String shaEncodeSignature(String inStr) throws Exception {
		MessageDigest sha = null;
		try {
			sha = MessageDigest.getInstance("SHA");
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

		byte[] byteArray = inStr.getBytes("UTF-8");
		byte[] md5Bytes = sha.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}

	/**
	 * @param inStr 待加密字符串
	 * @param type 签名加密 加密方式 0:MD5,1:SHA
	 * @param token 加密token
	 * @return
	 */
	public static String signature(String inStr, int type, String token) {
		String encodeStr = "";
		if (type == 0) {
			try {
				encodeStr = md5EncodeSignature(token + ":" + inStr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				encodeStr = shaEncodeSignature(token + ":" + inStr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return encodeStr;
	}
}