package ay.it.asp.entity;

public class ClassTest {
	private String classTestId;
	private String classId;
	private String testId;
	private String classTestState;
	private Classes classes;
	private Test test;
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Test getTest() {
		return test;
	}
	public void setTest(Test test) {
		this.test = test;
	}
	public String getClassTestId() {
		return classTestId;
	}
	public void setClassTestId(String classTestId) {
		this.classTestId = classTestId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public String getClassTestState() {
		return classTestState;
	}
	public void setClassTestState(String classTestState) {
		this.classTestState = classTestState;
	}
	@Override
	public String toString() {
		return "ClassTest [classTestId=" + classTestId + ", classId=" + classId + ", testId=" + testId
				+ ", classTestState=" + classTestState + ", classes=" + classes + ", test=" + test + "]";
	}
}
