package ddit.finalproject.team2.util.enumpack;

public enum BrowserType {
	IE("internet explorer"), TRIDENT("internet explorer over version 11"), CHROME("chrome"), FIREFOX("firefox"), OTHER("other");
	
	private String text;
	public String getText(){
		return text;
	}
	
	BrowserType(String text){
		this.text = text;
	}
	
	public static BrowserType matchedType(String userAgent){
		BrowserType[] types = values();
		userAgent = userAgent.toUpperCase();
		BrowserType result = OTHER;
		for(BrowserType tmp : types){
			if(userAgent.contains(tmp.name())){
				result = tmp;
				break;
			}
		}
		return result;
	}
}
