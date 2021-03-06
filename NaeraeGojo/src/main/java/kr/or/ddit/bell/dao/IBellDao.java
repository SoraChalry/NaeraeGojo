package kr.or.ddit.bell.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ComputationVO;
import kr.or.ddit.vo.FeedbackVO;
import kr.or.ddit.vo.IssueVO;

public interface IBellDao {

	public List<IssueVO> getIssueList(Map<String, String> params) throws SQLException;
	public String getIssueCount(Map<String, String> params) throws SQLException;
	public void issueAlarm(Map<String, String> param) throws SQLException;
	public String getFeedbackCnt(Map<String, String> params) throws SQLException;
	public List<FeedbackVO> receivefbList(Map<String, String> params) throws SQLException;
	public String getsenFeedCnt(Map<String, String> params) throws SQLException;
	public List<FeedbackVO> sendfeedCnt(Map<String, String> params) throws SQLException;

}
