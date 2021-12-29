package kh.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance = null;

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	private MemberDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); // 경로(java:comp/env/) + 자원의
																				// 이름(jdbc/oracle)
		return ds.getConnection();
	}

	public boolean isIdExist(String id) throws Exception {
		String sql = "select * from member where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();

			}
		}
	}

	public int insert(MemberDTO dto) throws Exception {
		String sql = "insert into member values(?,?,?,?,?,?,?,?,sysdate)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getZipcode());
			pstat.setString(7, dto.getAddress1());
			pstat.setString(8, dto.getAddress2());
			int result = pstat.executeUpdate();
			con.commit();
			return result;

		}
	}

	public boolean isLoginAllowed(String id, String pw) throws Exception {

		String sql = "select * from member where id =? and pw = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, id);
			pstat.setString(2, pw);

			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}

	}

	public int leave(String id) throws Exception {
		String sql = "delete from member where id=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}

	}

	public MemberDTO selectById(String paramId) throws Exception {
		String sql = "select * from member where id =? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, paramId);
			try (ResultSet rs = pstat.executeQuery()) {

				MemberDTO dto = new MemberDTO();
				if (rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setZipcode(rs.getString("zipcode"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setSignup_date(rs.getDate("signup_date"));
					return dto;
				}
				return null;

			}
		}
	}
}