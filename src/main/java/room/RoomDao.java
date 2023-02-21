package room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class RoomDao {
	public ArrayList<Room> selectAllRoom() {

		try {
			String SQL = "select * from room;";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<Room> roomList = new ArrayList<>();
			while (rs.next()) {
				Room room = new Room();
				room.setRidx(rs.getInt(1));
				room.setType(rs.getString(2));
				room.setPrice(rs.getInt(3));
				roomList.add(room);
			}
			rs.close();
			pstmt.close();
			conn.close();
			return roomList;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
	}

	public Room selectRoom(int ridx) {
		try {
			String SQL = "select * from room where ridx = ?;";
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ridx);
			ResultSet rs = pstmt.executeQuery();

			Room room = new Room();

			while (rs.next()) {
				room.setRidx(rs.getInt(1));
				room.setType(rs.getString(2));
				room.setPrice(rs.getInt(3));
			}

			rs.close();
			pstmt.close();
			conn.close();

			return room;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
	}
}
