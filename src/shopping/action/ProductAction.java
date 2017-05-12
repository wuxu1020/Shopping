package shopping.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import shopping.json.JsonUtil;
import shopping.model.Product;
import shopping.service.ProductService;



public class ProductAction extends SuperAction{
	private String pname;
	private Double price;
	private Integer stock;
	private List<String> ptype;
	private String gdetails;
	private String gexplain;
	private List<String> goodpicaddr;
	private Product product;
	private String searchvalue;
	private String searchresult;
	private Integer page;
	private Integer maxpage;
	private String jsonResult;
	private ProductService productservice;
	 //上传文件存放路径   
    private final static String UPLOADDIR = "/product";
    
    private List<File> mainpic;
    private List<String> mainpicFileName; 
    private List<String> mainpicContentType;
	private List<File> detimgUpload;   
    //上传文件名集合   
    private List<String> detimgUploadFileName;   
    //上传文件内容类型集合   
    private List<String> detimgUploadContentType;
	
    
	
	public String getSearchresult() {
		return searchresult;
	}
	public void setSearchresult(String searchresult) {
		this.searchresult = searchresult;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(Integer maxpage) {
		this.maxpage = maxpage;
	}
	public String getSearchvalue() {
		return searchvalue;
	}
	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public List<String> getPtype() {
		return ptype;
	}
	public void setPtype(List<String> ptype) {
		this.ptype = ptype;
	}
	public List<String> getGoodpicaddr() {
		return goodpicaddr;
	}
	public void setGoodpicaddr(List<String> goodpicaddr) {
		this.goodpicaddr = goodpicaddr;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getGdetails() {
		return gdetails;
	}
	public void setGdetails(String gdetails) {
		this.gdetails = gdetails.trim();
	}
	public String getGexplain() {
		return gexplain;
	}
	public void setGexplain(String gexplain) {
		this.gexplain = gexplain.trim();
	}
	
	public ProductService getProductservice() {
		return productservice;
	}
	public void setProductservice(ProductService productservice) {
		this.productservice = productservice;
	}
	public List<File> getDetimgUpload() {
		return detimgUpload;
	}
	public void setDetimgUpload(List<File> detimgUpload) {
		this.detimgUpload = detimgUpload;
		this.goodpicaddr=new ArrayList<String>();
	}
	public List<String> getDetimgUploadFileName() {
		return detimgUploadFileName;
	}
	public void setDetimgUploadFileName(List<String> detimgUploadFileName) {
		this.detimgUploadFileName = detimgUploadFileName;
	}
	public List<String> getDetimgUploadContentType() {
		return detimgUploadContentType;
	}
	public void setDetimgUploadContentType(List<String> detimgUploadContentType) {
		this.detimgUploadContentType = detimgUploadContentType;
	}
    public List<File> getMainpic() {
		return mainpic;
	}
	public void setMainpic(List<File> mainpic) {
		this.mainpic = mainpic;
	}
	public List<String> getMainpicFileName() {
		return mainpicFileName;
	}
	public void setMainpicFileName(List<String> mainpicFileName) {
		this.mainpicFileName = mainpicFileName;
	}
	public List<String> getMainpicContentType() {
		return mainpicContentType;
	}
	public void setMainpicContentType(List<String> mainpicContentType) {
		this.mainpicContentType = mainpicContentType;
	}
	public String getJsonResult() {
		return jsonResult;
	}
	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}
	
	public String showproduct(){
		int perpage=10;
		List<Product> plist;
		if(searchvalue.equals("")||searchvalue==null){
			plist=productservice.getProductDAO().findAll();
		}
		else {
			plist=productservice.getProductDAO().findByPropertyV("pname", searchvalue);
			
		}
		maxpage=(plist.size()+perpage-1)/perpage;
		int i=(page-1)*perpage;
		if(i<plist.size()){
			int toindex=(i+perpage)<=plist.size()?i+10:plist.size();
			searchresult=JsonUtil.listToJson(plist.subList(i, toindex));
		}
		return "AjaxResult";
	}
	
	public String upProduct() throws Exception{
		/*if(session.getAttribute("SupplierID")==null){
			return "SupplierNotLogin";
		}*/
		product=new Product();
		uploadmainPic(0);
    	for (int i = 0; i < detimgUpload.size(); i++) {   
            //循环上传每个文件   
				uploadFile(i);
        }  
    	for(int i=0;i<goodpicaddr.size();i++)
    		if(goodpicaddr.get(i).equals("")) goodpicaddr.remove(i);
    	
    	if(goodpicaddr.size()>0){
    		jsonResult = JsonUtil.listToJson(goodpicaddr);
    		product.setPdpic(jsonResult);
    	}
    	if(ptype.size()>0){
    		jsonResult = JsonUtil.listToJson(ptype);
    		product.setPtype(jsonResult);
    	}
    	//good.setGsid(session.getAttribute("SupplierID").toString());
    	product.setPid(UUID.randomUUID().toString());
    	product.setPstock(stock);
    	product.setPdetail(gdetails);
    	product.setPdescription(gexplain);
    	product.setPname(pname);
    	product.setPrice(price);
    	productservice.getProductDAO().merge(product);
        return "UpProduct";
    }
    
    private void uploadFile(int i) throws FileNotFoundException, IOException {   
        try {   
            InputStream in = new FileInputStream(detimgUpload.get(i));   
            String dir = ServletActionContext.getServletContext().getRealPath(UPLOADDIR);  
            File fileLocation = new File(dir);  
            //此处也可以在应用根目录手动建立目标上传目录  
            if(!fileLocation.exists()){  
                boolean isCreated  = fileLocation.mkdir();  
                if(!isCreated) {  
                    //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
                    return ;  
                }  
            }  
            
            String fileName=UUID.randomUUID().toString()+this.getDetimgUploadFileName().get(i);  
            File uploadFile = new File(dir, fileName);   
            OutputStream out = new FileOutputStream(uploadFile);  
            byte[] buffer = new byte[1024 * 1024];   
            int length;   
            while ((length = in.read(buffer)) > 0) {   
                out.write(buffer, 0, length);   
            }   
            goodpicaddr.add(fileName);
            in.close();   
            out.close();   
        } catch (FileNotFoundException ex) {   
            System.out.println("上传失败!");  
            ex.printStackTrace();   
        } catch (IOException ex) {   
            System.out.println("上传失败!");
            ex.printStackTrace();   
        }   
    }   
    
    private void uploadmainPic(int i) throws FileNotFoundException, IOException {   
        try {   
            InputStream in = new FileInputStream(mainpic.get(i));   
            String dir = ServletActionContext.getServletContext().getRealPath(UPLOADDIR);  
            File fileLocation = new File(dir);  
            //此处也可以在应用根目录手动建立目标上传目录  
            if(!fileLocation.exists()){  
                boolean isCreated  = fileLocation.mkdir();  
                if(!isCreated) {  
                    //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
                    return ;  
                }  
            }  
            String fileName=UUID.randomUUID().toString()+this.getMainpicFileName().get(i);  
            File uploadFile = new File(dir, fileName);   
            OutputStream out = new FileOutputStream(uploadFile);  
            byte[] buffer = new byte[1024 * 1024];   
            int length;   
            while ((length = in.read(buffer)) > 0) {   
                out.write(buffer, 0, length);   
            }
            product.setPmpic(fileName);
            in.close();   
            out.close();   
        } catch (FileNotFoundException ex) {   
            System.out.println("上传失败!");  
            ex.printStackTrace();   
        } catch (IOException ex) {   
            System.out.println("上传失败!");
            ex.printStackTrace();   
        }   
    } 
    
    public String DelImg(){
    	File file=new File("C:\\Program Files\\apache-tomcat-8.0.38\\webapps\\shop\\product");  
        File[] f=file.listFiles();  
        for(int i=0;i<f.length;i++){  
            if(f[i].getName().equals("f96fae4ee1f67fc22daa501b053bbc74.jpg")){  
                //删除文件  
                f[i].delete();  
            }
        }
        
        return "SupplierUpProduct";
    }
    
    
    public String ajaxUpImg() throws Exception{
    	for (int i = 0; i < detimgUpload.size(); i++) {   
            //循环上传每个文件   
				uploadFile(i);
        }
    	return "SupplierJsonResult";
    }
}