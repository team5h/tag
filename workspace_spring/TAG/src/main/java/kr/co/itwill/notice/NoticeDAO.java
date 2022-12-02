package kr.co.itwill.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	public NoticeDAO() {
		System.out.println("-----NoticeDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public int insert(NoticeDTO notice) {
		return sqlSession.insert("notice.insert", notice);
	}//insert() end
	
	public List<NoticeDTO> list() {
		return sqlSession.selectList("notice.list");
	}//list() end

	public List<NoticeDTO> detail(int n_no) {		
		return sqlSession.selectOne("notice.detail", n_no);
	}//detail() end
	
	
}//class end
