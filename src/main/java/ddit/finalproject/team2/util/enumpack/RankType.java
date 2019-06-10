package ddit.finalproject.team2.util.enumpack;

import ddit.finalproject.team2.vo.GradeRankVo;

public enum RankType {
	A,B,C,D,F;
	
	public static int matchType(GradeRankVo rank){
		int type = 4;
		if(A.equals(rank.getGraderank_rank())){
			type = 0;
		}
		if(B.equals(rank.getGraderank_rank())){
			type = 1;
		}
		if(C.equals(rank.getGraderank_rank())){
			type = 2;
		}
		if(D.equals(rank.getGraderank_rank())){
			type = 3;
		}
		
		return type;
	}
}
