package ddit.finalproject.team2.util.enumpack;

import ddit.finalproject.team2.vo.GradeRankVo;

public enum RankType {
	A("A"),B("B"),C("C"),D("D"),F("F");
	
	private String text;
	
	public String getText(){
		return text;
	}
	
	private RankType(String text){
		this.text = text;
	}
	
	public static int matchType(GradeRankVo rank){
		int type = 4;
		if(A.getText().equals(rank.getGraderank_rank())){
			type = 0;
		}
		if(B.getText().equals(rank.getGraderank_rank())){
			type = 1;
		}
		if(C.getText().equals(rank.getGraderank_rank())){
			type = 2;
		}
		if(D.getText().equals(rank.getGraderank_rank())){
			type = 3;
		}
		
		return type;
	}
}
