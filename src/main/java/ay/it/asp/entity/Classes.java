package ay.it.asp.entity;

public class Classes {
	private String classId;
	private String className;
	private String classYuanxi;
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassYuanxi() {
		return classYuanxi;
	}
	public void setClassYuanxi(String classYuanxi) {
		this.classYuanxi = classYuanxi;
	}
	@Override
	public String toString() {
		return "Classes [classId=" + classId + ", className=" + className + ", classYuanxi=" + classYuanxi + "]";
	}
}
