package util;


import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyReader {
//    private static String fileName;
//

    public static String getProperties(String name) {
        String value = null;
        Properties properties = new Properties();
        PropertyReader reader = new PropertyReader();
        try(InputStream input = reader.getClass().getClassLoader().getResourceAsStream("hibernate.properties")){
            properties.load(input);
            value = properties.getProperty(name);
        } catch (IOException e) {
            System.out.println("Can`t read properties file");
        }
        return value;
    }
}
