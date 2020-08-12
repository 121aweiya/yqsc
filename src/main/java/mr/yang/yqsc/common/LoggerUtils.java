package mr.yang.yqsc.common;

import mr.yang.yqsc.TestJava;
import org.apache.log4j.Logger;

public class LoggerUtils {

    public final static Logger logger = Logger.getLogger(LoggerUtils.class);

    public static void warmming(Class<?> classz, String msg) {
        logger.warn(classz.getName() + ":" + msg);
    }

    public static void error(Class<?> classz, String msg) {
        logger.error(classz.getName() + ":" + msg);
    }
}
