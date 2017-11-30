package com.cocosh.framework.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 加密工具类
 * 
 * @author jerry
 */
public class SecurityUtil {
	private static MessageDigest md = null;

	/**
	 * md5加密字符串
	 * 
	 * @param input
	 * @return
	 */
	public static String md5(String input) {
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(input.getBytes());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return new BigInteger(1, md.digest()).toString(16);
	}

	/**
	 * md5加密文件
	 * 
	 * @param file
	 * @return
	 */
	public static String md5(File file) {
		FileInputStream fis = null;
		try {
			md = MessageDigest.getInstance("MD5");
			fis = new FileInputStream(file);
			byte[] buffer = new byte[2048];
			int length = -1;
			while ((length = fis.read(buffer)) != -1) {
				md.update(buffer, 0, length);
			}
			return new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * md5加密文件流
	 * 
	 * @param iStream
	 * @return
	 */
	public static String md5(InputStream iStream) {
		//File文件 可以通过new FileInputStream(file)获取
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] buffer = new byte[2048];
			int length = -1;
			while ((length = iStream.read(buffer)) != -1) {
				md.update(buffer, 0, length);
			}
			return new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				iStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println(md5("NrHME9397OXas58Y60mn3GSYYP~534030~8cddbcb281234a45a4d25d1e9fc0881a~3.06~USD"));
//		System.out.println(md5(new File("D:\\test.txt")));
//		try {
//			System.out.println(md5(new FileInputStream(new File("D:\\test.txt"))));
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		}
//		System.out.println(encodeFile(new File("D:\\test.txt")));
	}

//	/**
//	 * MD5加密文件
//	 */
//	static char hexdigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8',
//			'9', 'a', 'b', 'c', 'd', 'e', 'f' };
//
//	public static String encodeFile(File file) {
//		FileInputStream fis = null;
//		try {
//			MessageDigest md = MessageDigest.getInstance("MD5");
//			fis = new FileInputStream(file);
//			byte[] buffer = new byte[2048];
//			int length = -1;
//			while ((length = fis.read(buffer)) != -1) {
//				md.update(buffer, 0, length);
//			}
//			byte[] b = md.digest();
//			return byteToHexString(b);
//
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			try {
//				fis.close();
//			} catch (IOException ex) {
//				ex.printStackTrace();
//			}
//		}
//		return null;
//	}
//
//	/**
//	 * 
//	 * 把byte[]数组转换成十六进制字符串表示形式
//	 * 
//	 * @param tmp
//	 *            要转换的byte[]
//	 * 
//	 * @return 十六进制字符串表示形式
//	 */
//
//	private static String byteToHexString(byte[] tmp) {
//		String s;
//		// 用字节表示就是 16 个字节
//		char str[] = new char[16 * 2]; // 每个字节用 16 进制表示的话，使用两个字符，
//		// 所以表示成 16 进制需要 32 个字符
//		int k = 0; // 表示转换结果中对应的字符位置
//		for (int i = 0; i < 16; i++) { // 从第一个字节开始，对 MD5 的每一个字节
//			// 转换成 16 进制字符的转换
//			byte byte0 = tmp[i]; // 取第 i 个字节
//			str[k++] = hexdigits[byte0 >>> 4 & 0xf]; // 取字节中高 4 位的数字转换,
//			// >>> 为逻辑右移，将符号位一起右移
//			str[k++] = hexdigits[byte0 & 0xf]; // 取字节中低 4 位的数字转换
//		}
//		s = new String(str); // 换后的结果转换为字符串
//		return s;
//	}
}
