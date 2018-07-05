package com.fh.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * @version
 */
public class ObjectExcelRead {

	/**
	 * @param filepath
	 *            //文件路径
	 * @param filename
	 *            //文件名
	 * @param startrow
	 *            //开始行号
	 * @param startcol
	 *            //开始列号
	 * @param sheetnum
	 *            //sheet
	 * @return list
	 */
	public static List<Object> readExcel(String filepath, String filename,
			int startrow, int startcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();

		try {
			File target = new File(filepath, filename);
			FileInputStream fi = new FileInputStream(target);
			HSSFWorkbook wb = new HSSFWorkbook(fi);
			HSSFSheet sheet = wb.getSheetAt(sheetnum); // sheet 从0开始
			int rowNum = sheet.getLastRowNum() + 1; // 取得最后一行的行号
			for (int i = startrow; i < rowNum; i++) { // 行循环开始
				PageData varpd = new PageData();
				HSSFRow row = sheet.getRow(i); // 行
				int cellNum = row.getLastCellNum(); // 每行的最后一个单元格位置
				for (int j = startcol; j < cellNum; j++) { // 列循环开始
					HSSFCell cell = row.getCell(Short.parseShort(j + ""));
					String cellValue = null;
					if (null != cell) {
						int type = cell.getCellType();
						if (type == 0) {
							cellValue = String.valueOf((long) cell
									.getNumericCellValue());
						}
						if (type == 1) {
							cellValue = cell.getStringCellValue();
						}
						if (type == 2) {
							cellValue = cell.getNumericCellValue() + "";
						}
						if (type == 3) {
							cellValue = "";
						}
						if (type == 4) {
							cellValue = String.valueOf(cell
									.getBooleanCellValue());
						}
						if (type == 5) {
							cellValue = String
									.valueOf(cell.getErrorCellValue());
						}
					} else {
						cellValue = "";
					}
					varpd.put("var" + j, cellValue);
					System.out.println(cellValue);
				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return varList;
	}
}
