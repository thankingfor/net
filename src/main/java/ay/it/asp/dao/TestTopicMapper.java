package ay.it.asp.dao;

import java.util.HashMap;
import java.util.List;

import ay.it.asp.entity.TestTopic;

public interface TestTopicMapper extends BaseMapper<TestTopic>{
	public int addTi(TestTopic testTopic);

	public Integer findone(HashMap <String,Object> map);

	public List<String> selectAlltopicId(String testId);

	public void deleteOne(HashMap<String, Object> map);

	public TestTopic findoneB(String testId, String topId);

	public void updateScore(HashMap<String, Object> map);
}
