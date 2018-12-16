package ay.it.asp.entity;

public class GradeDetail {
	private String gradeDetailId;
	private String gradeId;
	private String topId;
	private int stuScore;
	private String topDaan;
	public String getGradeDetailId() {
		return gradeDetailId;
	}
	public void setGradeDetailId(String gradeDetailId) {
		this.gradeDetailId = gradeDetailId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getTopId() {
		return topId;
	}
	public void setTopId(String topId) {
		this.topId = topId;
	}
	public int getStuScore() {
		return stuScore;
	}
	public void setStuScore(int stuScore) {
		this.stuScore = stuScore;
	}
	public String getTopDaan() {
		return topDaan;
	}
	public void setTopDaan(String topDaan) {
		this.topDaan = topDaan;
	}
	@Override
	public String toString() {
		return "GradeDetail [gradeDetailId=" + gradeDetailId + ", gradeId=" + gradeId + ", topId=" + topId
				+ ", stuScore=" + stuScore + ", topDaan=" + topDaan + "]";
	}
}
