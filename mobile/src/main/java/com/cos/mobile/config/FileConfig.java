package com.cos.mobile.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileConfig implements WebMvcConfigurer{
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 외부경로 저장 파일(이미지) view 출력 및 참조경로
		registry.addResourceHandler("/images/**").addResourceLocations("file:///C:/workspace/images/");
	}
}
