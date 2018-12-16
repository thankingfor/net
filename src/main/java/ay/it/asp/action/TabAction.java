package ay.it.asp.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ay.it.asp.entity.Classes;
import ay.it.asp.entity.Tab;
import ay.it.asp.entity.Teacher;
import ay.it.asp.entity.Test;
import ay.it.asp.service.TabService;
import ay.it.asp.service.TestService;


@Controller
@RequestMapping("/tab")
public class TabAction extends BaseAction{

	@Resource
	private TabService tabService;
	@Resource
	private TestService testService;
	
	//通过老师得teaId查询所有得classId,通过classId查找className
	@RequestMapping(value="/selectAllclass")
	public String selectAllclass(Teacher teacher,HttpServletRequest request){
		System.out.println("----teacher:"+teacher);
		List<Classes> classList = tabService.selectAllclass(teacher);
		System.out.println("----classList:"+classList);
		List<Test> testList = testService.selectAlltest(teacher);
		request.setAttribute("classList", classList);
		request.setAttribute("testList", testList);
		return "forward:/WEB-INF/tab/add.jsp";
	}
	
	/*添加*/
	@RequestMapping(value="/add")
	public String add(Tab tab){
		System.out.println("---action.Tab:"+tab);
		tabService.add(tab);
		return "forward:/WEB-INF/topic/add.jsp";
	}
	
}
