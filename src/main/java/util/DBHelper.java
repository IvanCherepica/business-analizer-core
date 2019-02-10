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

		configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		configuration.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
		configuration.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/db_schema?useUnicode=true&characterEncoding=utf8");
		configuration.setProperty("hibernate.connection.username", "root");
		configuration.setProperty("hibernate.connection.password", "admin");
		configuration.setProperty("hibernate.show_sql", "true");
		configuration.setProperty("hibernate.hbm2ddl.auto", "update");
		return configuration;
	}

	static public SessionFactory createSessionFactory(Configuration configuration) {
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder();
		builder.applySettings(configuration.getProperties());
		ServiceRegistry serviceRegistry = builder.build();
		return configuration.buildSessionFactory(serviceRegistry);
	}
}
