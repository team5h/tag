package kr.co.itwill.myticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyticketDAO {

	public MyticketDAO() {
		System.out.println("-----MyticketDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<MyticketDTO> list(){
		return sqlSession.selectList("myticket.list");
	}//list() end
	
}//class end
