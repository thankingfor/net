package ay.it.asp.service;

import java.util.List;

import ay.it.asp.entity.Page;
import ay.it.asp.entity.Teacher;
import ay.it.asp.entity.Test;
import ay.it.asp.entity.Topic;

public interface TestService extends BaseService<Test>{
	public int add(Test test);

	public Page<Test> selectPageUse(Page<Test> page);

	public void addTi(String[] pks, String testId);

	public Page<Topic> selectAlltestTopic(Test test, Page<Topic> page);

	public void deleteTestTopic(String[] pks, String testId);

	public int deleteTest(String[] pks);

	public void testOk(String[] pks);

	public Test findByTestId(String testId);

	public List<Test> selectAlltest(Teacher teacher);

	public Page<Test> selectAllClassTest(Teacher teacher, Page<Test> page);


}
