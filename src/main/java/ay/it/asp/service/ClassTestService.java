package ay.it.asp.service;

import java.util.List;

import ay.it.asp.entity.ClassTest;
import ay.it.asp.entity.Page;
import ay.it.asp.entity.Teacher;
import ay.it.asp.entity.Test;

public interface ClassTestService extends BaseService<ClassTest>{
	public int add(ClassTest classTest);

	public int orSave(ClassTest classTest);

	public Page<ClassTest> selectPageUse(Page<ClassTest> page, List<Test> listTest);

	public List<ClassTest> selectAllClassTest(Teacher teacher);
}
