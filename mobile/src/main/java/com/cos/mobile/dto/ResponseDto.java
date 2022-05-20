package com.cos.mobile.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponseDto<T> {
	int status;
	T date;
}
