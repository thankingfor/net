package ay.it.asp.service;

import java.util.List;

import ay.it.asp.entity.Grade;
import ay.it.asp.entity.GradeDetail;
import ay.it.asp.entity.Page;
import ay.it.asp.entity.Student;
import ay.it.asp.entity.Test;
import ay.it.asp.entity.Topic;

public interface StudentService extends BaseService<Student>{
	public Student login(Student student);

	public int repass(Student student);

	public Page<Test> selectAllTest(Student student, Page<Test> page);

	public Grade daTi(Test test, Student student);

	public List<Topic> selectAllTopic(Test test);

	public GradeDetail save(Topic topic, String string, Grade grade);

	public void updates(Grade grade);

	public List<Student> selectByClassId(String classId);

	public Grade findGrade(Student student, Test test);

	public List<Grade> selectAllGrade(Student student);

	public Grade selectBytestIdAndStuId(String stuId, String testId);
}
