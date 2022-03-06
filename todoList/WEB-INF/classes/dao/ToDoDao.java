package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.ToDoDto;

public class ToDoDao {
	
	
	public int addTodo(ToDoDto dto) {
		int insertCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO todo(name, title, sequence) VALUES(?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setInt(3, dto.getSequence());
			
			insertCount = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			checkClose(conn, ps);
		}
		return insertCount;
	}
	
	public ArrayList<ToDoDto> getTodos(String state){
		ArrayList<ToDoDto> todos = new ArrayList<ToDoDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			String sql = "select id, title, name, sequence, type, regdate from todo WHERE type = ? order by regdate desc";

			ps = conn.prepareStatement(sql);
			ps.setString(1, state);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Long id = rs.getLong("id");
				String title = rs.getString("title");
				String name = rs.getString("name");
				int sequence = rs.getInt("sequence");
				String type = rs.getString("type");
				String regDate = rs.getString("regdate");
				
				ToDoDto dto = new ToDoDto(id, name, regDate, sequence, title, type);
				todos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			checkClose(conn, ps, rs);
		}
		
		return todos;
	}
	
	public int updateTodo(Long todoId, Boolean first) {
		int updateCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		if(first) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
				String sql = "update todo set type = 'DOING' where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, todoId);
				
				updateCount = ps.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				checkClose(conn, ps);
			}
		} else {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
				String sql = "update todo set type = 'DONE' where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, todoId);
				
				updateCount = ps.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				checkClose(conn, ps);
			}
		}
		
		return updateCount;
	}
	
	public int deleteTodo(Long todoId) {
		int deleteCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			String sql = "DELETE FROM todo WHERE id = ?";
			ps = conn.prepareStatement(sql);
			ps.setLong(1, todoId);
			
			deleteCount = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			checkClose(conn, ps);
		}
		
		return deleteCount;
	}
	
	public void checkClose(Connection conn, PreparedStatement ps) {
		if(ps != null) {
			try {
				ps.close();
				System.out.println("ps 닫음");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
				System.out.println("conn 닫음");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void checkClose(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
				System.out.println("rs 닫음");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(ps != null) {
			try {
				ps.close();
				System.out.println("ps 닫음");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
				System.out.println("conn 닫음");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
