package ay.it.asp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import ay.it.asp.entity.ClassTest;
import ay.it.asp.entity.Classes;
import ay.it.asp.entity.Page;
import ay.it.asp.entity.Teacher;
import ay.it.asp.entity.Test;
import ay.it.asp.service.ClassTestService;
import ay.it.asp.utils.CommonUtils;

@Service("classTestService")
public class ClassTestServiceImpl extends BaseServiceImpl<ClassTest> implements ClassTestService{

	public int add(ClassTest classTest) {
		classTest.setClassTestId(new CommonUtils().getUUID());
		return classTestMapper.add(classTest);
	}

	/*通过testId和classId判断是否存在*/
	public int orSave(ClassTest classTest) {
		//如果test中state为未完成,就不添加返回0
		List<Test> listTests = testMapper.findByTestId(classTest.getTestId());
		if(listTests != null &&listTests.size()>0){
			if(listTests.get(0).getTestState().equals("完成")){
				return classTestMapper.orSave(classTest);
			}
		}
		return 0;
	}
	
	/*查询所有的卷子个人得并且是已经分配过得*/
	public Page<ClassTest> selectPageUse(Page<ClassTest> page, List<Test> listTest) {
		int totalRecord = 0;
		List<ClassTest> listTotal = new ArrayList<ClassTest>();
		List<ClassTest> list;
		for (Test test : listTest) {
			list = classTestMapper.selectAllByTestId(test.getTestId());
			for (ClassTest classTest : list) {
				listTotal.add(classTest);
				totalRecord++;
			}
		}
		page.setList(listTotal);
		page.setTotalRecord(totalRecord);
		return page;
	}

	public List<ClassTest> selectAllClassTest(Teacher teacher) {
		List<Test> testList = testMapper.selectAlltest(teacher.getTeaId());
		System.out.println("----------impl.testList"+testList);
		List<ClassTest> testList2 = new ArrayList<ClassTest>();
		List<ClassTest> list = new ArrayList<ClassTest>();
		List<ClassTest> testListAll2 = new ArrayList<ClassTest>();
		HashMap <String,Object> map ;
		for (Test test : testList) {
			//通过testId.利用多表联合查询,查出classtest对象
			testList2 = classTestMapper.selectAllByTestId(test.getTestId());
			System.out.println("----------impl.testList2"+testList2);
			for (ClassTest classTest : testList2) {
				//把所有查询出来得结果装到list集合
				map = new HashMap<String,Object>();
				map.put("testId", classTest.getTestId());
				map.put("classId", classTest.getClassId());
				testListAll2 = classTestMapper.selectAllClassTest(map);
				list.add(testListAll2.get(0));
			}
		}
		System.out.println("----------impl.list"+list);
		return list;
	}

}
