package ay.it.asp.dao;

import java.util.List;

import ay.it.asp.entity.Student;

public interface StudentMapper extends BaseMapper<Student>{
	public Student login(Student student);

	public int repass(Student student);

	public List<Student> selectById(String stuId);

	public List<Student> selectByClassId(String classId);
}
