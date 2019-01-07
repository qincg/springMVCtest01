package qcg.util;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.Assert.*;

public class StringUtilTest {
	private static Logger logger = LoggerFactory.getLogger(StringUtilTest.class);
	@Test
	public void getUUID() {
		for (int i = 0 ; i < 10 ; i ++) {
			logger.debug(StringUtil.getUUID());
		}
	}
}