package ay.it.asp.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.junit.Test;

import ay.it.asp.entity.Topic;

public class CommonUtils {

	@Test
	public String getUUID() {
		String uuid = UUID.randomUUID().toString();
		char[] UUID = new char[32];
		uuid = uuid.toUpperCase();
		for (int i = 0, j = 0; i < uuid.length(); i++) {
			if (uuid.charAt(i) != '-') {
				UUID[j++] = uuid.charAt(i);
			}
		}
		return String.valueOf(UUID);
	}

	// 打乱选项
	public Topic daLuanXuanXiang(Topic topic) {
		Topic t = new Topic();
		//list1存传来的四个选项
		List<String> list = new ArrayList<String>();
		list.add(topic.getTopA());
		list.add(topic.getTopB());
		list.add(topic.getTopC());
		list.add(topic.getTopD());
		//打乱方法
		Collections.shuffle(list);
		topic.setTopA(list.get(0));
		topic.setTopB(list.get(1));
		topic.setTopC(list.get(2));
		topic.setTopD(list.get(3));
		return topic;
	}

}
