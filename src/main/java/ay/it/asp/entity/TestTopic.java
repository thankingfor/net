package ay.it.asp.entity;

public class TestTopic {
	private String testTopicId;
	private String testId;
	private String topId;
	private int topScore;
	public int getTopScore() {
		return topScore;
	}
	public void setTopScore(int topScore) {
		this.topScore = topScore;
	}
	public String getTestTopicId() {
		return testTopicId;
	}
	public void setTestTopicId(String testTopicId) {
		this.testTopicId = testTopicId;
	}
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public String getTopId() {
		return topId;
	}
	public void setTopId(String topId) {
		this.topId = topId;
	}
	@Override
	public String toString() {
		return "TestTopic [testTopicId=" + testTopicId + ", testId=" + testId + ", topId=" + topId + ", topScore="
				+ topScore + "]";
	}
}
