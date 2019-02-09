package util;

import model.*;
import org.hibernate.cfg.Configuration;

public class DBHelper {

	static public Configuration getConfiguration() {
		Configuration configuration = new Configuration();
		configuration.addAnnotatedClass(Admin.class);
		configuration.addAnnotatedClass(BizType.class);
		configuration.addAnnotatedClass(District.class);
		configuration.addAnnotatedClass(Point.class);

		configuration.setProperty("hibernate.dialect", PropertiesReader.getProperties("dialect"));
		configuration.setProperty("hibernate.connection.driver_class", PropertiesReader.getProperties("driver.class"));
		configuration.setProperty("hibernate.connection.url", PropertiesReader.getProperties("connection.url"));
		configuration.setProperty("hibernate.connection.username", PropertiesReader.getProperties("username"));
		configuration.setProperty("hibernate.connection.password", PropertiesReader.getProperties("password"));
		configuration.setProperty("hibernate.show_sql", PropertiesReader.getProperties("show_sql"));
		configuration.setProperty("hibernate.hbm2ddl.auto", PropertiesReader.getProperties("hbm2ddl.auto"));
		return configuration;
	}
}
