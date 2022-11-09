package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.CartDTO;
import com.project.dto.CategoryDTO;
import com.project.dto.ColorDTO;
import com.project.dto.FileDTO;
import com.project.dto.ProductDTO;
import com.project.dto.SizesDTO;
import com.project.mapper.ProductMapper;

@Service
public class ProductService {

	private ProductMapper mapper;

	public ProductService(ProductMapper mapper) {
		this.mapper = mapper;
	}

	public List<ProductDTO> selectProductList() {
		return mapper.selectProductList();
	}

	public int deleteProduct(String[] index) {
		int count=0;
		for(int i = 0; i <index.length;i++) {
    		String str = index[i];
    		count += mapper.deleteProduct(str);
		}
		return count;
	}

	public String insertproduct(ProductDTO productdto) {
		String productcode = mapper.selectProductNO();
		productdto.setProductno(productcode);
		mapper.insertProduct(productdto);
		return productcode;
	}

	public int insertFileList(FileDTO fileDTO) {
		return mapper.insertFileList(fileDTO);
	}

	public ProductDTO selectProductDTO(String productno) {
		return mapper.selectProductDTO(productno);
	}

	public List<FileDTO> selectFilePath(String productno) {
	    List<FileDTO> list = mapper.selectFilePath(productno);
	    
	    int size = list.size();
	    if(size != 5) {
	        for(int i = size;i<5;i++) {
	            FileDTO file = new FileDTO();
	            file.setFileName("src");
	            list.add(file);
	        }
	    }
	    
		return list;
	}

	public String selectFile(String productno,int productphotono) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productno", productno);
		map.put("productphotono", productphotono);
		return mapper.selectFile(map);
	}

	public List<CategoryDTO> selectcategoryList() {
		return mapper.selectcategoryList();
	}

	public List<ProductDTO> selectProductDetailList(String categoryno) {
		return mapper.selectProductDetailList(categoryno);
	}

	public List<CartDTO> selectCartProduct(String memberid) {
		return mapper.selectCartProduct(memberid);
	}

	public int insertCartProduct(CartDTO cdto) {
		return mapper.insertCartProduct(cdto);
	}

	public CartDTO selectCartDTO(CartDTO cdto) {
		return mapper.selectCartDTO(cdto);
	}

	public int selectCart(CartDTO cdto) {
		return mapper.selectCart(cdto);
	}

	public ProductDTO ProductDetailView(String productname) {
		return mapper.ProductDetailView(productname);
	}

	
	public List<SizesDTO> selectProductSizesList(String productno) {
		List<SizesDTO> list = new ArrayList<>();
		String sizes = mapper.selectProductSizesList(productno);
		String [] arr = sizes.split(",");
		for(String sizeno : arr) {
			SizesDTO dto = mapper.selectProductSizesArray(sizeno);
			list.add(dto);
		}
		return list;
	}

	public List<ColorDTO> selectProductColorList(String productno) {
		List<ColorDTO> list = new ArrayList<>();
		String colors = mapper.selectProductColorList(productno);
		String[] arr = colors.split(",");
		for(String colorno : arr) {
			ColorDTO dto = mapper.selectProductColorArray(colorno);
			list.add(dto);
		}
		return list;
	}
	
	public int updateQuantity(CartDTO cdto) {
		return mapper.updateQuantity(cdto);
	}

	public List<ColorDTO> selectColorList() {
		return mapper.selectColorList();
	}
	
	public List<SizesDTO> selectSizeList() {
		return mapper.selectSizeList();
	}

	public List<ProductDTO> shopNewProductList(String productno) {
		return mapper.shopNewProductList(productno);
	}
	public List<SizesDTO> selectproductsizelist(ProductDTO pdto) {
		return mapper.selectproductsizelist(pdto);
	}
	
	public String selectProductNo(CartDTO cdto) {
		return mapper.selectProductNo(cdto);
	}
	
	public List<ProductDTO> shopBestProductList(String productno) {
		return mapper.shopBestProductList(productno);
	}

	public int updateProduct(ProductDTO productDto) {
		return mapper.updateProduct(productDto);
	}

	public List<ProductDTO> selectProductSimpleList(String categoryno) {
		return mapper.selectProductSimpleList(categoryno);
	}

	public List<ProductDTO> selectProduct() {
		return mapper.selectProduct();
	}

	public List<ColorDTO> selectColorSelectList(String productno) {
		String colorlist = mapper.selectProductColorList(productno);
		return mapper.selectColorSelectList(colorlist);
	}

	public List<SizesDTO> selectSizesSelectList(String productno) {
		String sizelist = mapper.selectProductSizesList(productno);
		return mapper.selectSizesSelectList(sizelist);
	}

	public List<ProductDTO> selectProductListCategory(String productno) {
		String categoryno = mapper.selectCategoryno(productno);
		return mapper.selectProductListCategory(categoryno);
	}

	public int selectProductSimpleCount(String categoryno) {
		return mapper.selectProductSimpleCount(categoryno);
	}

	public int selectFileEa(String productno) {
		return mapper.selectFileEa(productno);
	}

	public int deletePrevFile(String productno) {
		return mapper.deletePrevFile(productno);
	}

	public String selectDeleteFilePath(String productno) {
		return mapper.selectDeleteFilePath(productno);
	}

	public int deleteCart(String memberId, String productno) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("productno", productno);
		map.put("memberId", memberId);
		
		return mapper.deleteCart(map);
	}
}
