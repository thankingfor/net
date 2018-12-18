package ay.it.asp.dao;

import org.apache.ibatis.annotations.Select;

import ay.it.asp.entity.Teacher;

public interface TeacherMapper extends BaseMapper<Teacher>{
	
	public Teacher logins(Teacher teacher);

	public int repass(Teacher teacher);
}
