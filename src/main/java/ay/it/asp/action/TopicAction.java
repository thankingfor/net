package ay.it.asp.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ay.it.asp.entity.Page;
import ay.it.asp.entity.Topic;
import ay.it.asp.service.TopicService;


@Controller
@RequestMapping("/topic")
public class TopicAction extends BaseAction{

	@Resource
	private TopicService topicService;
	
	/*删除*/
	@RequestMapping("/deleteList")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object deleteList(String [] pks){
		System.out.println("---doAjax.deleteList:"+pks);
		int i = 0;
		try {
			i = topicService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	/*修改*/
	@RequestMapping(value="/update")
	public String update(Topic topic) throws Exception{
		System.out.println("---action.update:"+topic);
		topicService.update(topic);
		return "forward:/WEB-INF/topic/update.jsp";
	}
	
	/*查询所有该老师出的题*/
	@RequestMapping(value="/selectAll")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUse(Page<Topic> page,Topic topic){
		
		page.setParamEntity(topic);
		System.out.println("----page:"+page);

		Page<Topic> p = topicService.selectPageUse(page);
		System.out.println("----page:"+page);
		return p.getPageMap();
	}
	
	/*查询多有的题*/
	@RequestMapping(value="/select")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUseDyc(Page<Topic> page,Topic topic){
		
		page.setParamEntity(topic);
		System.out.println("----page:"+page);

		Page<Topic> p = topicService.selectPageUseDyc(page);
		System.out.println("----page:"+page);
		return p.getPageMap();
	}
	
	/*添加*/
	@RequestMapping(value="/add")
	public String add(Topic topic){
		System.out.println("---action.topic:"+topic);
		topicService.add(topic);
		return "forward:/WEB-INF/topic/add.jsp";
	}
	
}
