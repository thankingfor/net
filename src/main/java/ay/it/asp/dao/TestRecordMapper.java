package ay.it.asp.dao;

import ay.it.asp.entity.TestRecord;

public interface TestRecordMapper extends BaseMapper<TestRecord>{
	public int add(TestRecord testRecord);
}
