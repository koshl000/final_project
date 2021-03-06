package ddit.finalproject.team2.util.enumpack;

public enum EvaluationType {
	MIDTERM("중간고사"), FINAL("기말고사"), ABSENCE("출석"), ASSIGNMENT("과제");
	
	private String text;
	public String getText(){
		return text;
	}
	
	private EvaluationType(String text) {
		this.text = text;
	}
	
	public static String[] getRateArr(String type, String rate, String[] rateArr){
		if(EvaluationType.MIDTERM.getText().contains(type)){
			rateArr[0] = rate;
		}
		if(EvaluationType.FINAL.getText().contains(type)){
			rateArr[1] = rate;
		}
		if(EvaluationType.ABSENCE.getText().contains(type)){
			rateArr[2] = rate;
		}
		if(EvaluationType.ASSIGNMENT.getText().contains(type)){
			rateArr[3] = rate;
		}
		
		return rateArr;
	}
	
}
