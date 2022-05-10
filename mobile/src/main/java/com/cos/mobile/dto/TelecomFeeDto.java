package com.cos.mobile.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TelecomFeeDto {
	private int telid;
	private String feename;
	private int fee;
}
