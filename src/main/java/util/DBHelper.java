package util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import model.Admin;
import model.BizType;
import model.District;
import model.Point;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

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
		configuration.setProperty("hibernate.connection.url", PropertiesReader.getProperties("connection.url"));
		configuration.setProperty("hibernate.connection.url", PropertiesReader.getProperties("connection.url"));
		configuration.setProperty("hibernate.connection.username", PropertiesReader.getProperties("username"));
		configuration.setProperty("hibernate.connection.password", PropertiesReader.getProperties("password"));
		configuration.setProperty("hibernate.show_sql", PropertiesReader.getProperties("show_sql"));
		configuration.setProperty("hibernate.hbm2ddl.auto", PropertiesReader.getProperties("hbm2ddl.auto"));


		return configuration;
	}

	static public SessionFactory createSessionFactory(Configuration configuration) {
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder();
		builder.applySettings(configuration.getProperties());
		ServiceRegistry serviceRegistry = builder.build();
		return configuration.buildSessionFactory(serviceRegistry);
	}
}
