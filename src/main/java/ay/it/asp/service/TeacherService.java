package ay.it.asp.service;

import ay.it.asp.entity.Teacher;

public interface TeacherService extends BaseService<Teacher>{
	public Teacher login(Teacher teacher);

	public int repass(Teacher teacher);
}
