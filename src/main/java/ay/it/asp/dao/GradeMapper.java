package ay.it.asp.dao;

import java.util.HashMap;
import java.util.List;

import ay.it.asp.entity.Grade;
import ay.it.asp.entity.Student;

public interface GradeMapper extends BaseMapper<Grade>{

	void add(Grade g);

	Grade findByMap(HashMap<String, Object> map);

	List<Grade> selectAllGrade(Student student);
	
}
