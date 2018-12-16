package ay.it.asp.entity;

public class Topic {
	   /*题目id*/
	   private String topId;
	   /*那个老师出的题*/
	   private String teaId;
	   /*类型 /1填空/2单选择/3多选*/
	   private String topType;
	   /*考试知识点*/
	   private String topKnowledge;
	   /*难度*/
	   private String topNandu;
	   /*题目 */
	   private String topTimu;
	   /*选项a*/
	   private String topA;
	   /*选项b*/ 
	   private String topB;
	   /*选项c*/
	   private String topC;
	   /*选项d*/
	   private String topD;
	   /*答案*/
	   private String topDaan;
	   /*多选的答案a*/
	   private String topDaanA;
	   /*多选的答案b*/
	   private String topDaanB;
	   /*多选的答案c*/
	   private String topDaanC;
	   /*多选的答案d*/
	   private String topDaanD;
	public String getTopId() {
		return topId;
	}
	public void setTopId(String topId) {
		this.topId = topId;
	}
	public String getTeaId() {
		return teaId;
	}
	public void setTeaId(String teaId) {
		this.teaId = teaId;
	}
	public String getTopType() {
		return topType;
	}
	public void setTopType(String topType) {
		this.topType = topType;
	}
	public String getTopKnowledge() {
		return topKnowledge;
	}
	public void setTopKnowledge(String topKnowledge) {
		this.topKnowledge = topKnowledge;
	}
	public String getTopNandu() {
		return topNandu;
	}
	public void setTopNandu(String topNandu) {
		this.topNandu = topNandu;
	}
	public String getTopTimu() {
		return topTimu;
	}
	public void setTopTimu(String topTimu) {
		this.topTimu = topTimu;
	}
	public String getTopA() {
		return topA;
	}
	public void setTopA(String topA) {
		this.topA = topA;
	}
	public String getTopB() {
		return topB;
	}
	public void setTopB(String topB) {
		this.topB = topB;
	}
	public String getTopC() {
		return topC;
	}
	public void setTopC(String topC) {
		this.topC = topC;
	}
	public String getTopD() {
		return topD;
	}
	public void setTopD(String topD) {
		this.topD = topD;
	}
	public String getTopDaan() {
		return topDaan;
	}
	public void setTopDaan(String topDaan) {
		this.topDaan = topDaan;
	}
	public String getTopDaanA() {
		return topDaanA;
	}
	public void setTopDaanA(String topDaanA) {
		this.topDaanA = topDaanA;
	}
	public String getTopDaanB() {
		return topDaanB;
	}
	public void setTopDaanB(String topDaanB) {
		this.topDaanB = topDaanB;
	}
	public String getTopDaanC() {
		return topDaanC;
	}
	public void setTopDaanC(String topDaanC) {
		this.topDaanC = topDaanC;
	}
	public String getTopDaanD() {
		return topDaanD;
	}
	public void setTopDaanD(String topDaanD) {
		this.topDaanD = topDaanD;
	}
	@Override
	public String toString() {
		return "Topic [topId=" + topId + ", teaId=" + teaId + ", topType=" + topType + ", topKnowledge=" + topKnowledge
				+ ", topNandu=" + topNandu + ", topTimu=" + topTimu + ", topA=" + topA + ", topB=" + topB + ", topC="
				+ topC + ", topD=" + topD + ", topDaan=" + topDaan + ", topDaanA=" + topDaanA + ", topDaanB=" + topDaanB
				+ ", topDaanC=" + topDaanC + ", topDaanD=" + topDaanD + "]";
	}
}
