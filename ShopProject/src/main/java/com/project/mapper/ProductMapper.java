package com.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CartDTO;
import com.project.dto.ColorDTO;
import com.project.dto.FileDTO;
import com.project.dto.ProductDTO;
import com.project.dto.SizesDTO;
import com.project.dto.CategoryDTO;

@Mapper
public interface ProductMapper {

	List<ProductDTO> selectProductList();

	int deleteProduct(String str);

	void insertProduct(ProductDTO productdto);

	String selectProductNO();

	int insertFileList(FileDTO fileDTO);

	ProductDTO selectProductDTO(String productno);

	List<FileDTO> selectFilePath(String productno);

	String selectFile(Map<String, Object> map);

	List<CategoryDTO> selectcategoryList();

	List<ProductDTO> selectProductDetailList(String categoryno);

	List<CartDTO> selectCartProduct(String memberid);


	CartDTO selectCartDTO(CartDTO cdto);

	int deleteCart(HashMap<Object, Object> map);

	ProductDTO ProductDetailView(String productname);

	String selectProductSizesList(String productno);

	String selectProductColorList(String productno);

	int selectCart(CartDTO cdto);

	int updateQuantity(CartDTO cdto);

	List<ColorDTO> selectColorList();

	List<SizesDTO> selectSizeList();

	int insertCartProduct(CartDTO cdto);

	List<ProductDTO> shopNewProductList(String productno);

	List<SizesDTO> selectproductsizelist(ProductDTO pdto);
	String selectProductNo(CartDTO cdto);
	List<ProductDTO> shopBestProductList(String productno);

	int updateProduct(ProductDTO productDto);

	List<ProductDTO> selectProductSimpleList(String categoryno);

	ColorDTO selectProductColorArray(String colorno);

	SizesDTO selectProductSizesArray(String sizeno);

	List<ProductDTO> selectProduct();

	List<SizesDTO> selectSizesSelectList(String sizelist);

	List<ColorDTO> selectColorSelectList(String colorlist);

	String selectCategoryno(String productno);

	List<ProductDTO> selectProductListCategory(String categoryno);

	int selectProductSimpleCount(String categoryno);

	int selectFileEa(String productno);

	int deletePrevFile(String productno);

	String selectDeleteFilePath(String productno);
}
