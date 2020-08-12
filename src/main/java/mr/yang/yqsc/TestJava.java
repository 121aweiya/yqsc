package mr.yang.yqsc;

import mr.yang.yqsc.common.LoggerUtils;
import mr.yang.yqsc.common.MD5Util;

public class TestJava {

    public static void main(String[] args) {


        System.out.println(MD5Util.getMD5Code("123"));

        LoggerUtils.error(TestJava.class,"错误");
    }
}
