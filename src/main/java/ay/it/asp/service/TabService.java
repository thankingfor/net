package ay.it.asp.service;

import java.util.List;

import ay.it.asp.entity.Classes;
import ay.it.asp.entity.Tab;
import ay.it.asp.entity.Teacher;

public interface TabService extends BaseService<Tab>{
	public int add(Tab tab);

	public List<Classes> selectAllclass(Teacher teacher);
}
