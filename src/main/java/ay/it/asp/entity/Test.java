package ay.it.asp.entity;

import java.util.List;

public class Test {
	private String testId;
	private String teaId;
	private String testName;
	private String testNandu;
	private int testScore;
	private int testTotal;
	private int testTime;
	private String testState;
	private List<Classes> classesList; 
	private Classes classes;
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public List<Classes> getClassesList() {
		return classesList;
	}
	public void setClassesList(List<Classes> classesList) {
		this.classesList = classesList;
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
		return "Test [testId=" + testId + ", teaId=" + teaId + ", testName=" + testName + ", testNandu=" + testNandu
				+ ", testScore=" + testScore + ", testTotal=" + testTotal + ", testTime=" + testTime + ", testState="
				+ testState + ", classesList=" + classesList + ", classes=" + classes + "]";
	}
}
