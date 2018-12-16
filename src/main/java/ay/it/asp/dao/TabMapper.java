package ay.it.asp.dao;

import java.util.List;

import ay.it.asp.entity.Tab;

public interface TabMapper extends BaseMapper<Tab>{
	public int add(Tab tab);

	public List<Tab> selectAllclassId(String teaId);
}
