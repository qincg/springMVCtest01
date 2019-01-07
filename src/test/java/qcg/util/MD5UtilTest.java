package qcg.util;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MD5UtilTest {
	@Test
	public void test01(){
		MD5Util.getMD5("123");
	}
}