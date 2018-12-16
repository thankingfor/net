package ay.it.asp.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ay.it.asp.entity.Grade;
import ay.it.asp.entity.GradeDetail;
import ay.it.asp.entity.Page;
import ay.it.asp.entity.Student;
import ay.it.asp.entity.Test;
import ay.it.asp.entity.Topic;
import ay.it.asp.service.StudentService;
import ay.it.asp.service.TestService;
import ay.it.asp.service.TopicService;
import ay.it.asp.utils.CommonUtils;


@Controller
@RequestMapping("/student")
public class StudentAction extends BaseAction{

	@Resource
	private StudentService studentService;
	@Resource
	private TopicService topicService;
	@Resource
	private TestService testService;
	
	/**查询成绩
	 * 1.通过stuId得到List<Grade>
	 * 通过testId得到test对象
	 */
	@RequestMapping(value="/result")
	public String result(Student student,HttpServletRequest request) throws Exception{
		System.out.println("------action.student"+student);
		List<Grade> list = studentService.selectAllGrade(student);
		Test test = new Test();
		for (Grade grade : list) {
			test = testService.findByTestId(grade.getTestId());
			grade.setTest(test);
		}
		System.out.println("------action.List<Grade>"+list);
		request.setAttribute("list", list);
		return "forward:/WEB-INF/student/result.jsp";
	}
	
	/*答题结束
	 * 1.把传来的topId查询Topic ok
	 * 2.添加grade_detail数据 ok
	 * 3.grade表中通过gradeId修改testState为完成,添加stu_score ok
	 * 4.跳转新的页面,把题目,自己写的答案,正确答案显示出来,最后显示考试的试卷名(grade表有testId)称和总分(有stu_score字段) ok
	 * 5.实现页面  (未完成,等学会传值在做)
	 * */
	@RequestMapping(value="/finish")
	public String finish(String[] topId,String[] topDaan,Grade grade,HttpServletRequest request) throws Exception{
		int totalScore = 0;
		List<Topic> topicList = new ArrayList<Topic>();
		List<GradeDetail> gradeDetailList = new ArrayList<GradeDetail>();
		Test test = new Test();
		for (int i = 0; i < topId.length; i++) {
			Topic topic = topicService.findOneBytopId(topId[i]);
			topicList.add(topic);
			GradeDetail gradeDetail = studentService.save(topic,topDaan[i],grade);
			gradeDetailList.add(gradeDetail);
			totalScore += gradeDetail.getStuScore();
		}
		grade.setStuScore(totalScore);
		studentService.updates(grade);
		test = testService.findByTestId(grade.getTestId());
		//题目,正确答案都在
		request.setAttribute("Topic", topicList);
		//题目,自己写的答案都和得分
		request.setAttribute("gradeDetailList", gradeDetailList);
		//试卷做情况
		request.setAttribute("grade", grade);
		//试卷情况
		request.setAttribute("test", test);
		return "forward:/WEB-INF/student/finish.jsp";
	}
	
	/*开始答题,通过testId,填写grade方法*/
	@RequestMapping(value="/daTi")
	public String repass(Student student,Test test,HttpServletRequest request) throws Exception{
		System.out.println("---action.student:"+student);
		System.out.println("---action.test:"+test);
		//保存test到grade,得到gradeId,并且存到request域中
		Grade grade = studentService.daTi(test,student);
		request.setAttribute("grade", grade);
		//通过testId 从test_topic中查找所有的topicId,然后得到topic
		List<Topic> listTopic = studentService.selectAllTopic(test);
		request.setAttribute("listTopic", listTopic);
		//分为单选list 和填空list
		List<Topic> danxuanlist = new ArrayList<Topic>();
		List<Topic> tiankonglist = new ArrayList<Topic>();
		for (Topic topic : listTopic) {
			if(topic.getTopType().equals("填空")){
				tiankonglist.add(topic);
			} else if(topic.getTopType().equals("单选")){
				//打乱topA,B,C,D的顺序,在把topic返回回来
				topic = new CommonUtils().daLuanXuanXiang(topic);
				danxuanlist.add(topic);
			}
		}
		request.setAttribute("danxuanlist", danxuanlist);
		request.setAttribute("tiankonglist", tiankonglist);
		System.out.println("---action.danxuanlist:"+danxuanlist);
		System.out.println("---action.tiankonglist:"+tiankonglist);
		return "forward:/WEB-INF/student/dati.jsp";
	}
	
	/*查看所有试卷*/
	@RequestMapping(value="/selectAllTest")
	@ResponseBody
	public Object selectAllTest(Page<Test> page,Student student) throws Exception{
		System.out.println("---action.page:"+page);
		System.out.println("---action.student:"+student);
		Page<Test> p = studentService.selectAllTest(student,page);
		System.out.println("---action.p:"+p);
		return p.getPageMap();
	}
	
	/*修改密码*/
	@RequestMapping(value="/repass")
	public String repass(Student student,HttpSession session) throws Exception{
		System.out.println("---action.student:"+student);
		studentService.repass(student);
		session.setAttribute("student", student);
		return "forward:/WEB-INF/student/success.jsp";
	}
	
	@RequestMapping(value="/update")
	public String update(Student student,HttpSession session) throws Exception{
		System.out.println("---action.student:"+student);
		studentService.update(student);
		session.setAttribute("student", student);
		return "forward:/WEB-INF/student/success.jsp";
	}
	
	@RequestMapping(value="/login")
	public String login(Student student,HttpServletRequest request,HttpSession session){
		System.out.println("---action.student:"+student);
		Student stu = studentService.login(student);
		if(stu!=null){
			//存session
			session.setAttribute("student", stu);
			return "forward:/WEB-INF/main/studentMain.jsp";
		}else{
			request.setAttribute("msg", "用户名或密码错误！");
			return "forward:/studentLogin.jsp";
		}
	}
}
