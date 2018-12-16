package ay.it.asp.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.node.IntNode;

import ay.it.asp.entity.Teacher;
import ay.it.asp.service.TeacherService;


@Controller
@RequestMapping("/teacher")
public class TeacherAction extends BaseAction{

	@Resource
	private TeacherService teacherService;
	
	/*修改密码*/
	@RequestMapping(value="/repass")
	public String repass(Teacher teacher,HttpSession session) throws Exception{
		System.out.println("---action.teacher:"+teacher);
		teacherService.repass(teacher);
		session.setAttribute("teacher", teacher);
		return "forward:/WEB-INF/teacher/success.jsp";
	}
	
	@RequestMapping(value="/update")
	public String update(Teacher teacher,HttpSession session) throws Exception{
		System.out.println("---action.teacher:"+teacher);
		teacherService.update(teacher);
		session.setAttribute("teacher", teacher);
		return "forward:/WEB-INF/teacher/success.jsp";
	}
	
	@RequestMapping(value="/login")
	public String login(Teacher teacher,HttpServletRequest request,HttpSession session){
		System.out.println("---action.teacher:"+teacher);
		Teacher tea = teacherService.login(teacher);
		if(tea!=null){
			//存session
			session.setAttribute("teacher", tea);
			return "forward:/WEB-INF/main/teacherMain.jsp";
		}else{
			request.setAttribute("msg", "用户名或密码错误！");
			return "forward:/teacherLogin.jsp";
		}
	}
}
