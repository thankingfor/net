package ay.it.asp.dao;

import ay.it.asp.entity.Teacher;

public interface TeacherMapper extends BaseMapper<Teacher>{
	public Teacher login(Teacher teacher);

	public int repass(Teacher teacher);
}
