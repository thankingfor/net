package ay.it.asp.entity;

import java.util.Date;

public class TestRecord {
	private String testRecordId;
	private String testId;
	private String teaId;
	private String testName;
	private String testNandu;
	private int testScore;
	private int testTotal;
	private int testTime;
	private String testState;
	private Date testDeltime;
	public String getTestRecordId() {
		return testRecordId;
	}
	public void setTestRecordId(String testRecordId) {
		this.testRecordId = testRecordId;
	}
	public Date getTestDeltime() {
		return testDeltime;
	}
	public void setTestDeltime(Date testDeltime) {
		this.testDeltime = testDeltime;
	}
	public String getTestState() {
		return testState;
	}
	public void setTestState(String testState) {
		this.testState = testState;
	}
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public String getTeaId() {
		return teaId;
	}
	public void setTeaId(String teaId) {
		this.teaId = teaId;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getTestNandu() {
		return testNandu;
	}
	public void setTestNandu(String testNandu) {
		this.testNandu = testNandu;
	}
	public int getTestScore() {
		return testScore;
	}
	public void setTestScore(int testScore) {
		this.testScore = testScore;
	}
	public int getTestTotal() {
		return testTotal;
	}
	public void setTestTotal(int testTotal) {
		this.testTotal = testTotal;
	}
	public int getTestTime() {
		return testTime;
	}
	public void setTestTime(int testTime) {
		this.testTime = testTime;
	}
	@Override
	public String toString() {
		return "TestRecord [testRecordId=" + testRecordId + ", testId=" + testId + ", teaId=" + teaId + ", testName="
				+ testName + ", testNandu=" + testNandu + ", testScore=" + testScore + ", testTotal=" + testTotal
				+ ", testTime=" + testTime + ", testState=" + testState + ", testDeltime=" + testDeltime + "]";
	}
}
