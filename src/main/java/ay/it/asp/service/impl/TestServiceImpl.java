package ay.it.asp.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import ay.it.asp.entity.ClassTest;
import ay.it.asp.entity.Classes;
import ay.it.asp.entity.Page;
import ay.it.asp.entity.Teacher;
import ay.it.asp.entity.Test;
import ay.it.asp.entity.TestRecord;
import ay.it.asp.entity.TestTopic;
import ay.it.asp.entity.Topic;
import ay.it.asp.service.TestService;
import ay.it.asp.utils.CommonUtils;

@Service("testService")
public class TestServiceImpl extends BaseServiceImpl<Test> implements TestService{

	public int add(Test test) {
		//设置题目id
		test.setTestId(new CommonUtils().getUUID());
		System.out.println("----service.test"+test);
		return testMapper.add(test);
	}

	public Page<Test> selectPageUse(Page<Test> page) {
		page.setList(testMapper.selectPageListUse(page));
		page.setTotalRecord(testMapper.selectPageCountUse(page));
		return page;
	}

	public void addTi(String[] pks, String testId) {
		TestTopic testTopic;
		HashMap <String,Object> map ;
		for (String s : pks) {
			map = new HashMap<String,Object>();
			map.put("topId", s);
			map.put("testId", testId);
			if(testTopicMapper.findone(map) != 1){
				testTopic = new TestTopic();
				testTopic.setTestTopicId(new CommonUtils().getUUID());
				testTopic.setTestId(testId);
				testTopic.setTopId(s);
				testTopicMapper.addTi(testTopic);
				//添加一个试题 卷子得题数加一
				testMapper.pulsTotal(testId);
			}
		}
	}

	//通过testId查询topic_test表中的所有得topicid 然后通过topic找到topic封装到page中
	public Page<Topic> selectAlltestTopic(Test test,Page<Topic> page) {
		//通过testId查询topic_test表中的所有得topicid
		List <String> list = testTopicMapper.selectAlltopicId(test.getTestId());
		System.out.println("---------selectAlltestTopic.selectAlltopicId"+list);
		//得到list封装得字符串后
		List<Topic> listTopic = new ArrayList<Topic>();
		List<Topic> listTopicPage = new ArrayList<Topic>();
		Topic topic;
		for (String topId : list) {
			//通过topId得到topic
			topic = topicMapper.findOneBytopId(topId);
			System.out.println("-----------findOneBytopId"+topic);
			listTopic.add(topic);
		}
		System.out.println("---------listTopic"+listTopic);
		//做分页
		page.setTotalRecord(listTopic.size());
		for (int i = 0; i < listTopic.size(); i++) {
			if((page.getPage()-1)*page.getRows()<=i &&(page.getPage())*page.getRows()>i){
				listTopicPage.add(listTopic.get(i));
			}
		}
		page.setList(listTopicPage);
		System.out.println("---------service.page"+page);
		return page;
	}

	/*删除卷子中得题目*/
	public void deleteTestTopic(String[] pks, String testId) {
		TestTopic testTopic;
		HashMap <String,Object> map ;
		for (String s : pks) {
			map = new HashMap<String,Object>();
			map.put("topId", s);
			map.put("testId", testId);
			//如果能找到这个记录
			if(testTopicMapper.findone(map) == 1){
				//删除记录
				testTopicMapper.deleteOne(map);
				//添加一个试题 卷子得题数加一
				testMapper.delTotal(testId);
			}
		}
	}

	//删除卷子  并把删除得卷子备份到test_record中
	public int deleteTest(String[] pks) {
		Test test;
		TestRecord testRecord = new TestRecord() ;
		//查询出所有得test数据存入testRecord中
		for (String testId : pks) {
			List<Test> list = testMapper.findByTestId(testId);
			System.out.println("------------testId"+testId);
			System.out.println("-----serviceImpl.list.get(0)"+list.get(0));
			test = list.get(0);
			//封装方法testRecord
			testRecord.setTeaId(test.getTeaId());
			testRecord.setTestDeltime(new Date());
			testRecord.setTestId(test.getTestId());
			testRecord.setTestName(test.getTestName());
			testRecord.setTestNandu(test.getTestNandu());
			testRecord.setTestRecordId(new CommonUtils().getUUID());
			testRecord.setTestScore(test.getTestScore());
			testRecord.setTestState(test.getTestState());
			testRecord.setTestTime(test.getTestTime());
			testRecord.setTestTotal(test.getTestTotal());
			//封装好后加入数据库
			testRecordMapper.add(testRecord);
			System.out.println("-----serviceImpl.testRecord"+testRecord);
		}
		//统一删除
		testMapper.deleteList(pks);
		return 0;
	}

	/*试卷完成 也就是把传来得testId 把试卷表中得state属性变为完成
	 * 设置分数通过testId查询Test的总分
	 * */
	public void testOk(String[] pks ) {
		Test test = new Test();
		HashMap <String,Object> map ;
		for (String testId : pks) {
			test = findByTestId(testId);
			test.setTestState("完成");
			System.out.println("------impl.test"+test);
			testMapper.testOk(test);
			//设置每道题的分数
			int totalScore = test.getTestScore();
			int totalNumber = test.getTestTotal();
			int score = totalScore/totalNumber;
			int endScore = totalScore - score*(totalNumber-1);
			List<String> topId = testTopicMapper.selectAlltopicId(testId);
			System.out.println("---------impl.topId"+topId);
			for (int i = 0; i < topId.size(); i++) {
				if(i == topId.size()-1  &&  endScore != score){
					//不能被整除,最后一道题的分数设置为endScore
					score = endScore;
				}
				map = new HashMap<String, Object>();
				map.put("score", score);
				map.put("topId", topId.get(i));
				map.put("testId", testId);
				testTopicMapper.updateScore(map);
			}
		}
	}

	/*返回单个test*/
	public Test findByTestId(String testId) {
		List<Test> list = testMapper.findByTestId(testId);
		Test test = new Test();
		if(list!=null && list.size() >0){
			test = list.get(0);
		}
		return test;
	}

	/*查询所有test*/
	public List<Test> selectAlltest(Teacher teacher) {
		return testMapper.selectAlltest(teacher.getTeaId());
	}

	//多表联合查询,得到通过class_test得到class和test信息
	public Page<Test> selectAllClassTest(Teacher teacher, Page<Test> page) {
		//通过老师找到所有的testId
		List<Test> testList = testMapper.selectAlltest(teacher.getTeaId());
		System.out.println("----------impl.testList"+testList);
		List<Test> testListAll = new ArrayList<Test>();
		List<Test> testListAll2 = new ArrayList<Test>();
		List<ClassTest> testList2 = new ArrayList<ClassTest>();
		List<Test> list = new ArrayList<Test>();
		HashMap <String,Object> map ;
		Classes c = new Classes();
		for (Test test : testList) {
			//通过testId.利用多表联合查询,查出classtest对象
			testList2 = classTestMapper.selectAllByTestId(test.getTestId());
			System.out.println("----------impl.testList2"+testList2);
			for (ClassTest classTest : testList2) {
				//把所有查询出来得结果装到list集合
				map = new HashMap<String,Object>();
				map.put("testId", classTest.getTestId());
				map.put("classId", classTest.getClassId());
				testListAll2 = testMapper.selectAllClassTest(map);
				c = testListAll2.get(0).getClassesList().get(0);
				testListAll2.get(0).setClasses(c);
				testListAll.add(testListAll2.get(0));
			}
		}
		System.out.println("----------impl.testListAll"+testListAll);
		//分页操作  1.总纪录数 2.List集合
		page.setTotalRecord(testListAll.size());
		for (int i = 0; i < testListAll.size(); i++) {
			if((page.getPage()-1)*page.getRows()<=i &&(page.getPage())*page.getRows()>i){
				list.add(testListAll.get(i));
			}
		}
		System.out.println("----------impl.list"+list);
		page.setList(list);
		System.out.println("----------page.list"+page);
		return page;
	}

}
