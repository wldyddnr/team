package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;

public class MemberDao {

	public int insertMember(String id, String name, String password) {

		try {
			String SQL = "insert into member Values(?,?,?)";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			int result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();

			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;
	}

	public ArrayList<Member> selectAllMember() {

		try {
			String SQL = "select * from member;";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<Member> memberList = new ArrayList<>();
			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString(1));
				member.setName(rs.getString(2));
				member.setPassword(rs.getString(3));
				memberList.add(member);
			}
			rs.close();
			pstmt.close();
			conn.close();
			return memberList;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
	}

	public Member selectMember(String id) {
		try {
			String SQL = "select id,name,password from member where id = ?;";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			Member member = new Member();

			while (rs.next()) {
				member.setId(rs.getString(1));
				member.setName(rs.getString(2));
				member.setPassword(rs.getString(3));
			}

			rs.close();
			pstmt.close();
			conn.close();

			return member;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
	}

	public String selectPassword(String id, String name) {
		try {
			String SQL = "select password from member where id = ? and name = ?;";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			ResultSet rs = pstmt.executeQuery();
			String password = "";

			while (rs.next()) {
				password = rs.getString(1);
			}

			rs.close();
			pstmt.close();
			conn.close();

			return password;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return "";
	}

	public int updateMember(Member member) {
		try {
			String SQL = "update member set name=?, password=? where id=?";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getId());
			int result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;
	}

	public List<String> selectId(String name) {
		try {
			String SQL = "select id from member where name = ?;";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			List<String> idList = new ArrayList<>();

			while (rs.next()) {
				idList.add(rs.getString(1));
			}

			rs.close();
			pstmt.close();
			conn.close();

			return idList;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
	}
}
