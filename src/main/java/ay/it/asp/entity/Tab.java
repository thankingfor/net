package ay.it.asp.entity;

public class Tab {
	private String tabId;
	private String teaId;
	private String classId;
	public String getTabId() {
		return tabId;
	}
	public void setTabId(String tabId) {
		this.tabId = tabId;
	}
	public String getTeaId() {
		return teaId;
	}
	public void setTeaId(String teaId) {
		this.teaId = teaId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	@Override
	public String toString() {
		return "Tab [tabId=" + tabId + ", teaId=" + teaId + ", classId=" + classId + "]";
	}
}
