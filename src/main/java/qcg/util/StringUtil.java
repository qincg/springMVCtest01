package qcg.util;

import java.util.UUID;

/**
 * @Author: qcg
 * @Description:
 * @Date: 2018/12/29 16:09
 */
public class StringUtil {
	public static String getUUID(){
		String uuid = UUID.randomUUID().toString();
		return uuid.replaceAll("-", "");
	}
}
