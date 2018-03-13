package com.jsr.project.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QRUtil {
	
	public static void makeQR(String url,int width,int height,String file_path,String file_name) throws WriterException, IOException {
		File file=null;
		file=new File(file_path);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		QRCodeWriter writer=new QRCodeWriter();
		try {
			url=new String(url.getBytes("UTF-8"), "ISO-8859-1");
			BitMatrix matrix=writer.encode(url, BarcodeFormat.QR_CODE, width, height);
			int qrColor=0xFFad1004;
			MatrixToImageConfig config=new MatrixToImageConfig(qrColor, 0xFFFFFFFF);
			BufferedImage qrImage=MatrixToImageWriter.toBufferedImage(matrix, config);
			ImageIO.write(qrImage, "png", new File(file_path+file_name));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
