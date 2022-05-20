package com.cos.mobile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cos.mobile.model.Files;
import com.cos.mobile.repository.FileRepository;

@Service
public class FileService {
	@Autowired
	FileRepository fileRepository;
	
	public void save(Files files) {
		Files f = new Files();
		f.setFilename(files.getFilename());
		f.setFileOriName(files.getFileOriName());
		f.setFileurl(files.getFileurl());
		
		fileRepository.save(f);
	}
}
