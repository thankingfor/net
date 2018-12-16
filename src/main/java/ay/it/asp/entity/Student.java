package ay.it.asp.entity;

public class Student {
	private String stuId;
	private String stuPass;
	private String stuName;
	private String stuSex;
	private String stuPhone;
	private String stuComedata;
	private String classId;
	private String stuFavorable;
	private String stuWords;
	private String stuRemark;
	private Grade grade;
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuPass() {
		return stuPass;
	}
	public void setStuPass(String stuPass) {
		this.stuPass = stuPass;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuSex() {
		return stuSex;
	}
	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}
	public String getStuPhone() {
		return stuPhone;
	}
	public void setStuPhone(String stuPhone) {
		this.stuPhone = stuPhone;
	}
	public String getStuComedata() {
		return stuComedata;
	}
	public void setStuComedata(String stuComedata) {
		this.stuComedata = stuComedata;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getStuFavorable() {
		return stuFavorable;
	}
	public void setStuFavorable(String stuFavorable) {
		this.stuFavorable = stuFavorable;
	}
	public String getStuWords() {
		return stuWords;
	}
	public void setStuWords(String stuWords) {
		this.stuWords = stuWords;
	}
	public String getStuRemark() {
		return stuRemark;
	}
	public void setStuRemark(String stuRemark) {
		this.stuRemark = stuRemark;
	}
	@Override
	public String toString() {
		return "Student [stuId=" + stuId + ", stuPass=" + stuPass + ", stuName=" + stuName + ", stuSex=" + stuSex
				+ ", stuPhone=" + stuPhone + ", stuComedata=" + stuComedata + ", classId=" + classId + ", stuFavorable="
				+ stuFavorable + ", stuWords=" + stuWords + ", stuRemark=" + stuRemark + ", grade=" + grade + "]";
	}
}
