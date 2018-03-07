package com.jsr.project.daos;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.PointDto;

public interface IAcountDao {
	
	public boolean goalInsert(AcountDto dto);
	
	public boolean goalRegInsert(AcountDto dto);
	
	public boolean goalPointInsert(AcountDto dto);

}
