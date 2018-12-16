package ay.it.asp.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ay.it.asp.entity.Classes;
import ay.it.asp.entity.Tab;
import ay.it.asp.entity.Teacher;
import ay.it.asp.service.TabService;

@Service("tabService")
public class TabServiceImpl extends BaseServiceImpl<Tab> implements TabService{

	public int add(Tab tab) {
		return tabMapper.add(tab);
	}

	//通过老师得teaId查询所有得classId,通过classId查找className
	public List<Classes> selectAllclass(Teacher teacher) {
		System.out.println("-----serviceImpl.teacher"+teacher);
		List<Tab> tabs = tabMapper.selectAllclassId(teacher.getTeaId());
		System.out.println("--------------serviceImpl.tabs"+tabs);
		List<Classes> className = new ArrayList<Classes>();
		for (Tab tab : tabs) {
			Classes classes = classesMapper.selectClassById(tab.getClassId());
			System.out.println("--------------serviceImpl.classes"+classes);
			className.add(classes);
		}
		System.out.println("--------------serviceImpl.className"+className);
		return className;
	}

}
