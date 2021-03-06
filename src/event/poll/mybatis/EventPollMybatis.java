package event.poll.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ibatis.common.resources.Resources;

public class EventPollMybatis{
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			// Reader = 위치 지정 
			Reader reader = Resources.getResourceAsReader("sqlmapconfig/SqlMapConfig.xml");
			//1.SqlMapConfig.xml 
			// 들어오는 값을 지정 시켜줌
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			// 마이바티스로 바뀌면서 세션타입으로 처리를 해주게 됌
			reader.close();
		} catch (IOException e) {
			// Fail fast.
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
		}
	}
	public static void insertPoll() {
		// TODO Auto-generated method stub
		System.out.println("EventPollMybatis_insertPoll() 실행");
		
	}
	public static void deletePoll() {
		// TODO Auto-generated method stub
		System.out.println("EventPollMybatis_deletePoll() 실행");
		
	}
	public static void updatePoll() {
		// TODO Auto-generated method stub
		System.out.println("EventPollMybatis_updatePoll() 실행");
		
	}
	public static List detailPoll() {
		// TODO Auto-generated method stub
		System.out.println("EventPollMybatis_detailPoll() 실행");
		SqlSession session = sqlMapper.openSession();
		
		List list = session.selectList("getCurrentEventState");
		session.commit();
		System.out.println("list.size() : " + list.size());
		session.close();
		
		
		return list;
		
	}
	public static void doPoll() {
		// TODO Auto-generated method stub
		System.out.println("EventPollMybatis_doPoll() 실행");
		
	}
	
	
}
