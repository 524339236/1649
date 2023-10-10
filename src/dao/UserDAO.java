package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.Date;
//import java.util.UUID;
import java.util.ArrayList;
import java.util.List;

import domain.Match;
import domain.User;
import util.ConnUtil;
//import util.DateUtil;
//import util.SHAUtil;

public class UserDAO {

	/**
	 * 
	 * @param userName
	 * @return user对象/null
	 * @throws SQLException
	 */
	public User existsUser(String userName) throws SQLException {
		String sql = "select *from tab_user where user_name = ?"; // sql语句
		Connection conn = ConnUtil.getConn();
		PreparedStatement pstat = conn.prepareStatement(sql);
		pstat.setString(1, userName);
		ResultSet rs = pstat.executeQuery();
		if (rs.next()) {
			User user = new User();
			user.setUserId(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserIdentity(rs.getString("user_identity"));
			return user; // 返回查询到的user对象
		} else {
			return null; // 不存在用户返回null
		}
	}

	/**
	 * 注册
	 * 
	 * @throws SQLException
	 */
	public void register(String userName, String userPassword, String userPhone, String userIdentity, String userEmail)
			throws SQLException {
		// String userSalt = UUID.randomUUID().toString();

		String sql = "insert into tab_user(user_name,user_password,user_phone,user_identity,user_email) "
				+ " values(?,?,?,?,?)";
		Connection conn = ConnUtil.getConn();
		PreparedStatement pstat = conn.prepareStatement(sql);
		pstat.setString(1, userName);
		pstat.setString(2, userPassword);
		pstat.setString(3, userPhone);
		pstat.setString(4, userIdentity);
		pstat.setString(5, userEmail);
		pstat.executeUpdate();
	}

	public List<User> findJoinerByStatusAndMatchId(String status, int mid) throws SQLException {
		List<User> userList = new ArrayList<User>();
		String sql = "SELECT tab_user.*, tab_join_match.* FROM tab_user "
				+ " LEFT JOIN tab_join_match ON tab_user.user_id = tab_join_match.uid "
				+ " WHERE tab_join_match.mid = ? and status = ? ORDER BY join_date DESC ";
		Connection conn = ConnUtil.getConn();
		PreparedStatement pstat = conn.prepareStatement(sql);
		pstat.setInt(1, mid);
		pstat.setString(2, status);

		ResultSet rs = pstat.executeQuery();
		while (rs.next()) {
			User user = new User();
			user.setUserId(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserIdentity(rs.getString("user_identity"));
			userList.add(user);
		}
		return userList;
	}

	public List<User> getAllUser() throws SQLException {
		List<User> userList = new ArrayList<User>();
		String sql = "SELECT * FROM tab_user ORDER BY user_id ASC ";
		Connection conn = ConnUtil.getConn();
		PreparedStatement pstat = conn.prepareStatement(sql);

		ResultSet rs = pstat.executeQuery();
		while (rs.next()) {
			User user = new User();
			user.setUserId(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserIdentity(rs.getString("user_identity"));
			userList.add(user);
		}
		return userList;
	}

	public User findCreater(int mid) throws SQLException {

		String sql = "SELECT tab_user.*, tab_create_match.* FROM tab_user "
				+ " LEFT JOIN tab_create_match ON tab_user.user_id = tab_create_match.uid "
				+ " WHERE tab_create_match.mid = ? ";
		Connection conn = ConnUtil.getConn();
		PreparedStatement pstat = conn.prepareStatement(sql);
		pstat.setInt(1, mid);

		ResultSet rs = pstat.executeQuery();
		if (rs.next()) {
			User user = new User();
			user.setUserId(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserIdentity(rs.getString("user_identity"));
			return user;
		}
		else return null;
	}

	public List<User> findManager(int mid) throws SQLException {
		List<User> userList = new ArrayList<User>();
		String sql = "SELECT tab_user.*, tab_manage_match.* FROM tab_user "
				+ " LEFT JOIN tab_manage_match ON tab_user.user_id = tab_manage_match.uid "
				+ " WHERE tab_manage_match.mid = ? ";
		Connection conn = ConnUtil.getConn();
		PreparedStatement pstat = conn.prepareStatement(sql);
		pstat.setInt(1, mid);

		ResultSet rs = pstat.executeQuery();
		while (rs.next()) {
			User user = new User();
			user.setUserId(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserIdentity(rs.getString("user_identity"));
			userList.add(user);
		}
		return userList;
	}

	public User existsJoinedMatchUser(int uid, int mid) throws SQLException {
		String sql = "SELECT tab_user.*, tab_join_match.* FROM tab_user "
				+ " LEFT JOIN tab_join_match ON tab_user.user_id = tab_join_match.uid "
				+ " WHERE tab_join_match.mid = ? and tab_join_match.uid = ?";
		Connection conn = ConnUtil.getConn();
		PreparedStatement pstat = conn.prepareStatement(sql);
		pstat.setInt(1, mid);
		pstat.setInt(2, uid);
		
		ResultSet rs = pstat.executeQuery();
		if (rs.next()) {
			User user = new User();
			user.setUserId(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserIdentity(rs.getString("user_identity"));
			return user;
		}
		else return null;
	}

}
