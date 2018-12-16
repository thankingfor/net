package ay.it.asp.service.impl;

import org.springframework.stereotype.Service;

import ay.it.asp.entity.Page;
import ay.it.asp.entity.Topic;
import ay.it.asp.service.TopicService;
import ay.it.asp.utils.CommonUtils;

@Service("topicService")
public class TopicServiceImpl extends BaseServiceImpl<Topic> implements TopicService{

	public int add(Topic topic) {
		//设置题目id
		topic.setTopId(new CommonUtils().getUUID());
		topic.setTopA(topic.getTopDaan());
		System.out.println("----service.topic"+topic);
		return topicMapper.add(topic);
	}

	public Page<Topic> selectPageUse(Page<Topic> page) {
		page.setList(topicMapper.selectPageListUse(page));
		page.setTotalRecord(topicMapper.selectPageCountUse(page));
		return page;
	}

	public Topic findOneBytopId(String topId) {
		return topicMapper.findOneBytopId(topId);
	}

}
