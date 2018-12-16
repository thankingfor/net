package ay.it.asp.dao;

import java.util.HashMap;
import java.util.List;

import ay.it.asp.entity.ClassTest;

public interface ClassTestMapper extends BaseMapper<ClassTest>{
	public int add(ClassTest classTest);

	public int orSave(ClassTest classTest);

	public List<ClassTest> selectAllByTestId(String testId);

	public List<ClassTest> selectAllClassTest(HashMap<String, Object> map);

	public List<ClassTest> selectAllByStuId(String classId);
}
