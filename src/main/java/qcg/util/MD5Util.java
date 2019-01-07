package qcg.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.DigestUtils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Author: qcg
 * @Description:
 * @Date: 2019/1/3 13:44
 */
public class MD5Util {
	private static Logger logger = LoggerFactory.getLogger(MD5Util.class);

	public static String getMD5(String str) {
		String md5Str = DigestUtils.md5DigestAsHex(str.getBytes());
		logger.info(md5Str);
		return md5Str;
	}
}
