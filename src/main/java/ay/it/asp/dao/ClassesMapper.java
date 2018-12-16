package ay.it.asp.dao;

import java.util.List;

import ay.it.asp.entity.Classes;
import ay.it.asp.entity.Test;

public interface ClassesMapper extends BaseMapper<Classes>{
	public int add(Classes classes);

	public Classes selectClassById(String classId);

}
