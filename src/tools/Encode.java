package tools;

        import java.io.UnsupportedEncodingException;

/**
 * Created by 云航 on 2015/11/30.
 * 该类专门用于处理项目中遇到的各类编码问题
 */
public class Encode {
    public static String ISO8859ToUtf8 (String str) throws UnsupportedEncodingException {
        byte[] bytes = str.getBytes("ISO-8859-1");
        return new String(bytes, "utf-8");
    }
}
