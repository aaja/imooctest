import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class StudentsTest {
	
	
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	@Before
	public void init()
	{
		//创建配置对象
		Configuration config = new Configuration().configure();
		//创建服务注册对象
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(config.getProperties()).buildServiceRegistry();
		//创建回话
		sessionFactory = config.buildSessionFactory(serviceRegistry);
		
		session = sessionFactory.openSession();
		
		//开启事物
		transaction = session.beginTransaction();
	}
	@After
	public void destroy()
	{
		//提交事物
		transaction.commit();
		session.close();
		sessionFactory.close();
	}
	@Test
	public void testSaveStudents()
	{
		Students s = new Students(1,"刘伟");
		session.save(s);
	}
}
