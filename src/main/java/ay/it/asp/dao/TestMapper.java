package ay.it.asp.dao;

import java.util.HashMap;
import java.util.List;

import ay.it.asp.entity.Page;
import ay.it.asp.entity.Test;

public interface TestMapper extends BaseMapper<Test>{
	public int add(Test test);

	public List<Test> selectPageListUse(Page<Test> page);

	public Integer selectPageCountUse(Page<Test> page);

	public void pulsTotal(String testId);
	
	public void delTotal(String testId);

	public List<Test> findByTestId(String testId);

	public void testOk(Test test);

	public List<Test> selectAlltest(String teaId);

	public List<Test> selectAllClassTest(HashMap<String, Object> map);

}
