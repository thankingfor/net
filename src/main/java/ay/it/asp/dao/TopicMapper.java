package ay.it.asp.dao;

import java.util.List;

import ay.it.asp.entity.Page;
import ay.it.asp.entity.Topic;

public interface TopicMapper extends BaseMapper<Topic>{
	public int add(Topic topic);

	public List<Topic> selectPageListUse(Page<Topic> page);

	public Integer selectPageCountUse(Page<Topic> page);

	public Topic findOneBytopId(String topId);
}
