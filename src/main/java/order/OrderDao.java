package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;

public class OrderDao {

	public int insertOrder(String uid, String startDate, String endDate, int ridx, int oPrice) {

		try {
			String SQL = "insert into orders(uid,startDate,endDate,ridx,oPrice) Values(?,?,?,?,?)";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, uid);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			pstmt.setInt(4, ridx);
			pstmt.setInt(5, oPrice);
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

	public List<Order> selectOrder(String uid) {
		try {
			String SQL = "select oidx,ridx,startDate,endDate,oPrice from orders where uid = ?;";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();

			List<Order> orders = new ArrayList<>();

			while (rs.next()) {
				Order order = new Order();
				order.setOidx(rs.getInt(1));
				order.setRidx(rs.getInt(2));
				order.setStartDate(rs.getString(3));
				order.setEndDate(rs.getString(4));
				order.setoPrice(rs.getInt(5));
				orders.add(order);
			}

			rs.close();
			pstmt.close();
			conn.close();

			return orders;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
	}

	public int deleteOrder(int oidx) {
		try {
			String sql = "delete from orders where oidx=?";

			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oidx);

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
}
