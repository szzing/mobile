package com.cos.mobile.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplySaveRequestDto {
	private int userId;
	private int qnaboardId;
	private String writer;
	private String content;
}
