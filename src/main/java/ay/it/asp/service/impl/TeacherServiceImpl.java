package ay.it.asp.service.impl;

import org.springframework.stereotype.Service;

import ay.it.asp.entity.Teacher;
import ay.it.asp.service.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl extends BaseServiceImpl<Teacher> implements TeacherService{

	
	public Teacher login(Teacher teacher) {
		return teacherMapper.logins(teacher);
	}

	public int repass(Teacher teacher) {
		return teacherMapper.repass(teacher);
	}

}
