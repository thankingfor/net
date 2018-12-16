package ay.it.asp.entity;

public class Teacher {
	/*教工号*/
   private String teaId;
   /*密码*/
   private String teaPass;
   /*名字*/
   private String teaName;
   /*性别*/
   private String teaSex;
   /*手机号*/
   private String teaPhone;
   /*入教时间*/
   private String teaComedata;
   /*喜好*/
   private String teaFavorable;
   /*名言*/
   private String teaWords;
   /*备注*/
   private String teaRemark;
public String getTeaId() {
	return teaId;
}
public void setTeaId(String teaId) {
	this.teaId = teaId;
}
public String getTeaPass() {
	return teaPass;
}
public void setTeaPass(String teaPass) {
	this.teaPass = teaPass;
}
public String getTeaName() {
	return teaName;
}
public void setTeaName(String teaName) {
	this.teaName = teaName;
}
public String getTeaSex() {
	return teaSex;
}
public void setTeaSex(String teaSex) {
	this.teaSex = teaSex;
}
public String getTeaPhone() {
	return teaPhone;
}
public void setTeaPhone(String teaPhone) {
	this.teaPhone = teaPhone;
}
public String getTeaComedata() {
	return teaComedata;
}
public void setTeaComedata(String teaComedata) {
	this.teaComedata = teaComedata;
}
public String getTeaFavorable() {
	return teaFavorable;
}
public void setTeaFavorable(String teaFavorable) {
	this.teaFavorable = teaFavorable;
}
public String getTeaWords() {
	return teaWords;
}
public void setTeaWords(String teaWords) {
	this.teaWords = teaWords;
}
public String getTeaRemark() {
	return teaRemark;
}
public void setTeaRemark(String teaRemark) {
	this.teaRemark = teaRemark;
}
@Override
public String toString() {
	return "teacher [teaId=" + teaId + ", teaPass=" + teaPass + ", teaName=" + teaName + ", teaSex=" + teaSex
			+ ", teaPhone=" + teaPhone + ", teaComedata=" + teaComedata + ", teaFavorable=" + teaFavorable
			+ ", teaWords=" + teaWords + ", teaRemark=" + teaRemark + "]";
}
}
