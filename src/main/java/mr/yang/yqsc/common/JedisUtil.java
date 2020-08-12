package mr.yang.yqsc.common;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Jedis工具类
 */
public final class JedisUtil {
    private static JedisPool jedisPool;

    static {

        //获取数据，设置到JedisPoolConfig中
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(50);
        config.setMaxIdle(10);

        //初始化JedisPool
        jedisPool = new JedisPool(config, "127.0.0.1", 6379);


    }


    /**
     * 获取连接方法
     */
    public static Jedis getJedis() {

        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
        }catch (Exception e){
            return null;
        }finally {
            return jedis;
        }

    }

    /**
     * 关闭Jedis
     */
    public static void close(Jedis jedis) {
        if (jedis != null) {
            jedis.close();
        }
    }
}
