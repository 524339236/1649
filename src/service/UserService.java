package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import dao.UserDAO;
import domain.User;
import exception.NameException;
import exception.PassException;
import util.ConnUtil;

public class UserService {
	private UserDAO userDao = new UserDAO();
	
	/**
	 * 根据用户名判断用户是否存在
	 * @param user_name 输入用户名
	 * @return user/null
	 */
	public User isExistsUser(String user_name) 
			throws SQLException{
		try {
			if(userDao.existsUser(user_name)!=null)return userDao.existsUser(user_name);
			else return null;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				ConnUtil.getConn().rollback();	//事务回滚
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			throw new RuntimeException(e);
		} finally{
			ConnUtil.closeConn();
		}
	}
	
	/**
	 * 用户注册
	 * @param user_name
	 * @param user_pass
	 * @param user_address
	 * @param user_phone
	 * @throws SQLException
	 */
	public void register(String userName, String userPassword, String userPhone, String userIdentity, String userEmail) throws SQLException{
		try {
			userDao.register(userName, userPassword, userPhone, userIdentity, userEmail);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				ConnUtil.getConn().rollback();	//����ع�
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			throw new RuntimeException(e);
		} finally{
			ConnUtil.closeConn();
		}
	}
	
	/**
	 * 用户登录֤
	 * @param userName 输入用户名
	 * @param userPassword 输入密码
	 * @return user
	 * @throws NameException 用户名不存在异常抛出
	 * @throws PassException 密码输入错误异常抛出
	 */
	public User isLogin(String userName, String userPassword) throws NameException, PassException{
		try {
			User user = this.userDao.existsUser(userName);
			if(user == null){
				throw new NameException("用户名不存在");
			} 
			if(userPassword.equals(user.getUserPassword())){
				return user;
			} else{
				throw new PassException("密码错误");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally{
			ConnUtil.closeConn();
		}
	}
	
	
	public List<User> findJoinerByStatusAndMatchId(String status, int mid){
		List<User> userList = new ArrayList<User>();
		try {
			userList = userDao.findJoinerByStatusAndMatchId(status, mid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	public List<User> getAllUser() {
		List<User> userList = new ArrayList<User>();
		try {
			userList = userDao.getAllUser();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	public User findCreater(int mid) {
		User user = new User();
		try {
			user = userDao.findCreater(mid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public List<User> findManager(int mid) {
		List<User> managerList = new ArrayList<User>();
		try {
			managerList = userDao.findManager(mid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return managerList;
	}

	public User haveJoinedMatch(int uid, int mid) {
		User user = new User();
		try {
			user = userDao.existsJoinedMatchUser(uid, mid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
}
