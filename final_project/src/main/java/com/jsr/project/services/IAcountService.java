package com.jsr.project.services;


import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.PointDto;

public interface IAcountService {
	
	public boolean goalInsert(AcountDto dto);
	
	public boolean goalPointInsert(AcountDto dto);

}
