package ddit.finalproject.team2.util.enumpack;

public enum RingType {
	BOARD("board","강좌게시판"), REPLY("reply","강좌게시판"), INVITATION("invitation","화상채팅"), ASSIGNMENT("assignment","과제물")
	, NOTICE("notice", "공지사항");
	
	private String type;
	private String title;
	
	public String getType() {
		return type;
	}
	public String getTitle() {
		return title;
	}
	
	private RingType(String type, String title){
		this.type = type;
		this.title = title;
	}
}
