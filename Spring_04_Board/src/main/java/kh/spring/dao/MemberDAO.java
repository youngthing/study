package kh.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public int idCheck(String id) throws Exception{
		String sql = "select count(*) from member where id = ?";
		return jdbc.queryForObject(sql, Integer.class, id);
	}
	
	public int insert(MemberDTO dto) throws Exception{
		String sql = "insert into member(id,name,phone,email,zipcode,address1,address2,signup_date,pw) values(?,?,?,?,?,?,?,sysdate,?)";
		return jdbc.update(sql,dto.getId(),dto.getName(),dto.getPhone(),dto.getEmail(),dto.getZipcode(),
				dto.getAddress1(),dto.getAddress2(),dto.getPw());
	}
	
	public int login(String id,String pw) throws Exception{
		String sql = "select count(*) from member where id=? and pw=?";
		return jdbc.queryForObject(sql, Integer.class, id, pw);
	}
	
	public int leave(String id) throws Exception{
		String sql = "delete from member where id=?";
		return jdbc.update(sql,id);
	}

}
