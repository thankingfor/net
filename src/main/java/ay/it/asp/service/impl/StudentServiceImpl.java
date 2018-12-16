package ay.it.asp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import ay.it.asp.entity.ClassTest;
import ay.it.asp.entity.Grade;
import ay.it.asp.entity.GradeDetail;
import ay.it.asp.entity.Page;
import ay.it.asp.entity.Student;
import ay.it.asp.entity.Test;
import ay.it.asp.entity.TestTopic;
import ay.it.asp.entity.Topic;
import ay.it.asp.service.StudentService;
import ay.it.asp.utils.CommonUtils;

@Service("studentService")
public class StudentServiceImpl extends BaseServiceImpl<Student> implements StudentService{

	public Student login(Student student) {
		return studentMapper.login(student);
	}

	public int repass(Student student) {
		return studentMapper.repass(student);
	}

	//通过stuid在classId中查找testId,通过testId查找test并且封装page然后返回
	public Page<Test> selectAllTest(Student student, Page<Test> page) {
		//通过stuid查询班级classid
		Student stu = studentMapper.selectById(student.getStuId()).get(0);
		//通过classid得到list
		List<ClassTest> listClassTest = classTestMapper.selectAllByStuId(stu.getClassId());
		System.out.println("----------impl.listClassTest"+listClassTest);
		List<Test> list = new ArrayList<Test>();
		List<Test> list2 = new ArrayList<Test>();
		List<Test> list3 = new ArrayList<Test>();
		for (ClassTest classTest : listClassTest) {
			list3 = testMapper.findByTestId(classTest.getTestId());
			System.out.println("----------impl.list3"+list3);
			if(list3!=null && list3.size()>0 ){
				System.out.println("----进来乐一次");
				list.add(list3.get(0));
			}
		}
		//分页操作  1.总纪录数 2.List集合
		page.setTotalRecord(list.size());
		for (int i = 0; i < list.size(); i++) {
			if((page.getPage()-1)*page.getRows()<=i &&(page.getPage())*page.getRows()>i){
				list2.add(list.get(i));
			}
		}
		System.out.println("----------impl.list2"+list2);
		page.setList(list2);
		System.out.println("----------page.list"+page);
		return page;
	}

	//保存test到grade
	public Grade daTi(Test test,Student student) {
		List<Test> testList = testMapper.findByTestId(test.getTestId());
		Grade g = new Grade();
		if(testList!=null && testList.size()>0){
			test = testList.get(0);
			g.setGradeId(new CommonUtils().getUUID());
			g.setStuId(student.getStuId());
			g.setTestId(test.getTestId());
			g.setTestState("未完成");
			gradeMapper.add(g);
		}
		return g;
	}

	//通过testId 从test_topic中查找所有的topicId,然后得到topic
	public List<Topic> selectAllTopic(Test test) {
		//得到所有的topicId
		List<String> testTopicList = testTopicMapper.selectAlltopicId(test.getTestId()); 
		System.out.println("--------impl.testTopicList"+testTopicList);
		Topic t = new Topic();
		List<Topic> listTopic = new ArrayList<Topic>();
		for (String topid : testTopicList) {
			t = topicMapper.findOneBytopId(topid);
			listTopic.add(t);
		}
		System.out.println("--------impl.listTopic"+listTopic);
		return listTopic;
	}
	
	//添加grade_detail数据
	public GradeDetail save(Topic topic, String topDaan, Grade grade) {
		int score = 0;
		if(topDaan.equals(topic.getTopDaan())){
			//通过grade中的testId查询出testtopic表中topId对应的socre
			TestTopic tt = testTopicMapper.findoneB(grade.getTestId(),topic.getTopId());
			score = tt.getTopScore();
		}
		GradeDetail gradeDetail = new GradeDetail();
		gradeDetail.setGradeDetailId(new CommonUtils().getUUID());
		gradeDetail.setGradeId(grade.getGradeId());
		gradeDetail.setTopDaan(topDaan);
		gradeDetail.setTopId(topic.getTopId());
		gradeDetail.setStuScore(score);
		gradeDetailMapper.add(gradeDetail);
		return gradeDetail;
	}
	
	//grade表中通过gradeId修改testState为完成,添加stu_score
	public void updates(Grade grade) {
		grade.setTestState("完成");
		gradeMapper.update(grade);
	}

	
	public List<Student> selectByClassId(String classId) {
		return studentMapper.selectByClassId(classId);
	}

	//通过
	public Grade findGrade(Student student, Test test) {
		Grade g = new Grade();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("stuId", student.getStuId());
		map.put("testId", test.getTestId());
		g = gradeMapper.findByMap(map);
		return g;
	}

	public List<Grade> selectAllGrade(Student student) {
		return gradeMapper.selectAllGrade(student);
	}

}
