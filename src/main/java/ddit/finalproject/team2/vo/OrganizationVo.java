package ddit.finalproject.team2.vo;

import lombok.EqualsAndHashCode;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;

import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="lower_organization")
@ToString
public class OrganizationVo implements Serializable{
	@NotNull private String lower_organization;
	@NotNull private String upper_organization;
}
