package kr.or.ddit.videochatroom.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;
import kr.or.ddit.vo.ChatListTempVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IVideoChatDaoImpl implements IVideoChatDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertVideoChat(Map<String, String> params) throws SQLException {
		
	}

	@Override
	public void updateVideoChat(VideoChatRoomVO pv) throws SQLException {
		client.update("videoRoom.updateVideoChat", pv);
	}

	@Override
	public void deleteVideoChat(Map<String, String> params) throws SQLException {
		client.update("videoRoom.deleteVideoChat", params);
	}

	@Override
	public List<ChatListTempVO> getVideoChatList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getVideoChatList", params);
	}

	@Override
	public List<ChatListTempVO> getVideoChat(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getVideoInfo", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("videoRoom.totalCount", params);
	}

	@Override
	public List<ProjectVO> getProjectList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getProjectList", params);
	}

}
