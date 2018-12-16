package ay.it.asp.service;

import ay.it.asp.entity.Page;
import ay.it.asp.entity.Topic;

public interface TopicService extends BaseService<Topic>{
	public int add(Topic topic);

	public Page<Topic> selectPageUse(Page<Topic> page);

	public Topic findOneBytopId(String string);
}
