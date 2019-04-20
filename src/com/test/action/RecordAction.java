package com.test.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.test.dao.GoodDao;
import com.test.dao.RecordDao;
import com.test.dao.SellDao;
import com.test.entity.GoodEntity;

public class RecordAction extends ActionSupport {

	private File upload;
	private String name;
	private String price;
	private String detail;
	private String uploadContentType;	//得到上传文件的类型
	private String uploadFileName;		//得到上传文件的名称

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			RecordDao recordDao = new RecordDao();
			String uId = session.getAttribute("uId").toString();
			if (uId == null) {
				return "failed";
			}
			session.setAttribute("recordList", recordDao.queryAllRecord(uId));
			return "success";
		} catch (Exception e) {
			return "failed";
		}
	}

	public String getMyPublished() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String uId = session.getAttribute("uId").toString();
			if (uId == null) {
				return "failed";
			}
			SellDao sellDao = new SellDao();
			int sellNumber = sellDao.querySellNumberByUId(String.valueOf(uId));
			int buyNumber = sellDao.queryBuyNumberByUId(String.valueOf(uId));
			GoodDao goodDao = new GoodDao();
			session.setAttribute("publishedList", goodDao.queryGoodByPublished(uId, "1"));
			session.setAttribute("sellNumber", sellNumber);
			session.setAttribute("buyNumber", buyNumber);
			return "success";
		} catch (Exception e) {
			return "failed";
		}
	}

	public String deletePublished() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		GoodDao goodDao = new GoodDao();
		goodDao.deletePublished(id);
		return null;
	}

	public String publishGood() throws IOException, ClassNotFoundException {
		String realPath=ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
	    File file = new File(realPath);
	    if(!file.exists())file.mkdirs();
	    GoodEntity good = new GoodEntity();
	    GoodDao goodDao = new GoodDao();
	    String uId = ServletActionContext.getRequest().getSession().getAttribute("uId").toString();
	    int id = goodDao.addGood(name, price, uId, detail);
	    String suffix = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);
	    String fileName = String.valueOf(id)+"."+suffix;
	    String url = realPath+"/"+fileName;
	    System.out.println(id);
	    System.out.println(url);
	    goodDao.updateGood(String.valueOf(id),fileName);
	    try {
            //保存文件
            FileUtils.copyFile(upload, new File(file,fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
		return getMyPublished();
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
}
