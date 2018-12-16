package ay.it.asp.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ay.it.asp.entity.Page;
import ay.it.asp.entity.Teacher;
import ay.it.asp.entity.Test;
import ay.it.asp.entity.Topic;
import ay.it.asp.service.TestService;


@Controller
@RequestMapping("/test")
public class TestAction extends BaseAction{

	@Resource
	private TestService testService;
	
	//多表联合查询,得到通过class_test得到class和test信息
	@RequestMapping(value="/selectAllClassTest")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectAllClassTest(Page<Test> page,Teacher teacher){
		System.out.println("----action.page:"+page);
		System.out.println("----action.teacher"+teacher);
		Page<Test> p = testService.selectAllClassTest(teacher,page);
		System.out.println("----action.page:"+page);
		return p.getPageMap();
	}
	
	//跳转得addti页面继续添加试题
	@RequestMapping(value="/addTiInTest")
	public String addTiInTest(Test test,HttpServletRequest request){
		System.out.println("---action.test:"+test);
		System.out.println("-----------testId"+test.getTestId());
		test = testService.findByTestId(test.getTestId());
		System.out.println("---action.test:"+test);
		request.setAttribute("test", test);
		return "forward:/WEB-INF/test/select.jsp";
	}
	
	/*试卷完成
	 * 1.保存所有的试题,并且设置分数
	 */
	@RequestMapping("/testOk")
	public void testOk(String [] pks){
		System.out.println("-------pks"+pks);
		testService.testOk(pks);
	}
	
	/*删除卷子中得题目*/
	@RequestMapping("/deleteTestTopic")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public void deleteTestTopic(String [] pks,String testId){
		System.out.println("-------pks"+pks);
		System.out.println("-------testId"+testId);
		testService.deleteTestTopic(pks,testId);
	}
	
	
	/*删除*/
	@RequestMapping("/deleteTest")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object deleteList(String [] pks){
		System.out.println("---doAjax.deleteList:"+pks);
		int i = 0;
		try {
			i = testService.deleteTest(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	/*修改*/
	@RequestMapping(value="/update")
	public String update(Test test) throws Exception{
		System.out.println("---action.update:"+test);
		testService.update(test);
		return "forward:/WEB-INF/topic/update.jsp";
	}
	
	
	/*查询试卷的试题*/
	@RequestMapping(value="/selectAlltestTopic")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectAlltestTopic(Page<Topic> page,Test test){
		Topic topic = new Topic();
		page.setParamEntity(topic);
		System.out.println("----page:"+page);
		System.out.println("----action.test"+test);
		Page<Topic> p = testService.selectAlltestTopic(test,page);
		System.out.println("----page:"+page);
		return p.getPageMap();
	}
	
	/*查询所有该老师出的试卷*/
	@RequestMapping(value="/selectAlltest")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUse(Page<Test> page,Test test){
		
		page.setParamEntity(test);
		System.out.println("----page:"+page);

		Page<Test> p = testService.selectPageUse(page);
		System.out.println("----page:"+page);
		return p.getPageMap();
	}
	
	/*添加题目*/
	@RequestMapping(value="/addTi")
	public String addTi(String [] pks,String testId){
		System.out.println("---action.addTi:"+pks+testId);
		testService.addTi(pks,testId);
		
		return "forward:/WEB-INF/test/select.jsp";
	}
	
	/*添加*/
	@RequestMapping(value="/add")
	public String add(Test test,HttpServletRequest request){
		System.out.println("---action.test:"+test);
		testService.add(test);
		request.setAttribute("test", test);
		return "forward:/WEB-INF/test/select.jsp";
	}
	
}
