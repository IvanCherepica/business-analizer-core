package util;

import model.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
//import model.*;
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

		configuration.setProperty("hibernate.dialect" ,PropertyReader.getProperties("dialect"));
		configuration.setProperty("hibernate.connection.driver_class", PropertyReader.getProperties("driver.class"));
		configuration.setProperty("hibernate.connection.url", PropertyReader.getProperties("connection.url"));
//		configuration.setProperty("hibernate.connection.url", PropertyReader.getProperties("connection.url"));
		configuration.setProperty("hibernate.connection.username", PropertyReader.getProperties("username"));
		configuration.setProperty("hibernate.connection.password", PropertyReader.getProperties("password"));
		configuration.setProperty("hibernate.show_sql", PropertyReader.getProperties("show_sql"));
		configuration.setProperty("hibernate.hbm2ddl.auto",PropertyReader.getProperties("hbm2ddl.auto"));




//		configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
//		configuration.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
//		configuration.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/ewp?useUnicode=true&characterEncoding=utf8");
//		//configuration.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/db_schema");
//		configuration.setProperty("hibernate.connection.username", "root");
//		configuration.setProperty("hibernate.connection.password", "root");
//		configuration.setProperty("hibernate.show_sql", "true");
//		configuration.setProperty("hibernate.hbm2ddl.auto", "create");
		return configuration;
	}

	static public SessionFactory createSessionFactory(Configuration configuration) {
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder();
		builder.applySettings(configuration.getProperties());
		ServiceRegistry serviceRegistry = builder.build();
		return configuration.buildSessionFactory(serviceRegistry);
	}
}
