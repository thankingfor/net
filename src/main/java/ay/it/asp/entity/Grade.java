package ay.it.asp.entity;

public class Grade {
	private String gradeId;
	private String stuId;
	private int stuScore;
	private String testId;
	private String testState;
	private Test test;
	public Test getTest() {
		return test;
	}
	public void setTest(Test test) {
		this.test = test;
	}
	public int getStuScore() {
		return stuScore;
	}
	public void setStuScore(int stuScore) {
		this.stuScore = stuScore;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public String getTestState() {
		return testState;
	}
	public void setTestState(String testState) {
		this.testState = testState;
	}
	@Override
	public String toString() {
		return "Grade [gradeId=" + gradeId + ", stuId=" + stuId + ", stuScore=" + stuScore + ", testId=" + testId
				+ ", testState=" + testState + ", test=" + test + "]";
	}
}
