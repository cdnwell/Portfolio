package com.namweb.domain.manager.book.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ManagerBookInfoTotalDTO {
	private int totalDate = 0;
	private int totalWork = 0;
	private int totalMorning = 0;
	private int totalAfternoon = 0;
	private int totalExtra = 0;
	
	public ManagerBookInfoTotalDTO (List<ManagerBookInfoDTO> infoList) {
		for(ManagerBookInfoDTO dto : infoList) {
			totalDate++;
			if (dto.isMorning()) {
				totalWork++;
				totalMorning++;
			}
			if (dto.isAfternoon()) {
				totalWork++;
				totalAfternoon++;
			}
			if (dto.isExtra()) {
				totalWork++;
				totalExtra++;
			}
		}
	}
}
