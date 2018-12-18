package ay.it.asp.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ay.it.asp.entity.ClassTest;
import ay.it.asp.entity.Classes;
import ay.it.asp.entity.Grade;
import ay.it.asp.entity.Page;
import ay.it.asp.entity.Student;
import ay.it.asp.entity.Teacher;
import ay.it.asp.entity.Test;
import ay.it.asp.service.ClassTestService;
import ay.it.asp.service.StudentService;
import ay.it.asp.service.TestService;


@Controller
@RequestMapping("/classTest")
public class ClassTestAction extends BaseAction{

	@Resource
	private ClassTestService classTestService;
	@Resource
	private TestService testService;
	@Resource
	private StudentService studentService;
	
	/**
	 * 完成本版试卷
	 * @param classes
	 * @param test
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/finish")
	public String finish(String classTestId,HttpServletRequest request){
		classTestService.finish(classTestId);
		return "forward:/WEB-INF/student/success.jsp";
	}
	
	
	/**通过classId和testId查看学生成绩
	 * 1.通过classId查询所有学生得到List<Student>
	 * 2.通过stuId和testId得到List<Grade>
	 * 3.返回到页面,显示学生名称,学生分数,试卷名称
	 */
	@RequestMapping(value="/result")
	public String result(Classes classes,Test test,HttpServletRequest request){
		System.out.println("----action.classes"+classes);
		System.out.println("------action.test"+test);
		test = testService.findByTestId(test.getTestId());
		System.out.println("--------action.t"+test);
		//通过classId查询所有学生得到List<Student>
		List<Student> listStudent = studentService.selectByClassId(classes.getClassId());
		//通过stuId和testId得到List<Grade>
		Grade grade = new Grade();
		for (Student student : listStudent) {
			grade = studentService.findGrade(student,test);
			student.setGrade(grade);
		}
		request.setAttribute("tests", test);
		request.setAttribute("listStudent", listStudent);
		return "forward:/WEB-INF/grade/result.jsp";
	}
	
	//多表联合查询,得到通过class_test得到class和test信息
	@RequestMapping(value="/selectAllClassTest2")
	public String selectAllClassTest2(Teacher teacher,HttpServletRequest request){
		System.out.println("----action.teacher"+teacher);
		List<ClassTest> ct = classTestService.selectAllClassTest(teacher);
		System.out.println("------action.ClassTestList"+ct);
		request.setAttribute("list", ct);
		return "forward:/WEB-INF/grade/select.jsp";
	}
	
	//多表联合查询,得到通过class_test得到class和test信息
	@RequestMapping(value="/selectAllClassTest")
	public String selectAllClassTest(Teacher teacher,HttpServletRequest request){
		System.out.println("----action.teacher"+teacher);
		List<ClassTest> ct = classTestService.selectAllClassTest(teacher);
		System.out.println("------action.ClassTestList"+ct);
		request.setAttribute("list", ct);
		return "forward:/WEB-INF/tab/select.jsp";
	}
	
	/*通过teaId查询它得所有卷子testId,然后通过testId查询所有得classTest*/
	@RequestMapping(value="/selectAlltest")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUse(Page<ClassTest> page,Teacher teacher){
		System.out.println("----page:teacher"+page+teacher);
		List<Test> listTest = testService.selectAlltest(teacher);
		Page<ClassTest> p = classTestService.selectPageUse(page,listTest);
		System.out.println("----page:"+page);
		return p.getPageMap();
	}
	
	/*添加*/
	@RequestMapping(value="/add")
	public String add(ClassTest classTest){
		System.out.println("---action.classTest:"+classTest);
		//校验数据库中是否已经存在testid和对应得classId,存在就报错
		int i = classTestService.orSave(classTest);
		if(i == 1){
			return "forward:/WEB-INF/tab/false.jsp";
		}
		classTestService.add(classTest);
		return "forward:/WEB-INF/tab/success.jsp";
	}
	
}
