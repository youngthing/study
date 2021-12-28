package kh.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kh.web.dto.MessageDTO;

@Repository
public class MessageDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	public int insert(MessageDTO dto) throws Exception {
		String sql = "insert into messages values(messages_seq.nextval,?,?,default)";
		 return jdbc.update(sql, dto.getMessage(), dto.getWriter());
	}
	
	public List<MessageDTO> selectAll() throws Exception { 
		String sql = "select * from messages order by 1";
		jdbc.query(sql, new RowMapper() {
			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				return null;
			}
		});
		
		//jdbc.query : List 데이터를 가져올 때 사용
		//jdbc.queryForObject : 한개의 데이터를 가져올 때 사용한다.
		
	}

//	public int insert(MessageDTO dto) throws Exception {
//
//		String sql = "insert into messages values(messages_seq.nextval,?,?,default)";
//
//		try (Connection con = bds.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//
//			pstat.setString(1, dto.getMessage());
//			pstat.setString(2, dto.getWriter());
//			return pstat.executeUpdate();
//		}
//	}
//
//	public List<MessageDTO> selectAll() throws Exception {
//
//		String sql = "select * from messages order by 1";
//
//		try (Connection con = bds.getConnection();
//				PreparedStatement pstat = con.prepareStatement(sql);
//				ResultSet rs = pstat.executeQuery();) {
//
//			List<MessageDTO> list = new ArrayList();
//
//			while (rs.next()) {
//				int seq = rs.getInt("seq");
//				String message = rs.getString("message");
//				String writer = rs.getString("writer");
//				Timestamp date = rs.getTimestamp("write_date");
//
//				list.add(new MessageDTO(seq, message, writer, date));
//			}
//			return list;
//		}
//	}
//
//	public int delete(int seq) throws Exception {
//
//		String sql = "delete from messages where seq=?";
//
//		try (Connection con = bds.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//
//			pstat.setInt(1, seq);
//			return pstat.executeUpdate();
//		}
//	}
//
//	public int update(MessageDTO dto) throws Exception {
//
//		String sql = "update messages set writer=?, message=? where seq=?";
//
//		try (Connection con = bds.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//			pstat.setString(1, dto.getWriter());
//			pstat.setString(2, dto.getMessage());
//			pstat.setInt(3, dto.getSeq());
//			return pstat.executeUpdate();
//		}
//	}

}
