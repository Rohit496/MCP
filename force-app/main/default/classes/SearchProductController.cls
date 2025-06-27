public with sharing class SearchProductController {
  @InvocableMethod(
    label='Search Products'
    description='Finds products based on the given criteria'
  )
  public static List<ProductResponse> searchProducts(List<ProductRequest> req) {
    List<ProductWrapper> listProductWraps = new List<ProductWrapper>();
    List<ProductResponse> productResponses = new List<ProductResponse>();

    ProductRequest request = req[0];
    Integer intCount = request.Count;
    String productName = request.Name;
    System.debug('Count: ' + intCount);
    System.debug('Product Name: ' + productName);

    List<Product2> listProducts = [
      SELECT Id, Name, ProductCode
      FROM Product2
      WHERE Name LIKE :('%' + productName + '%')
      ORDER BY Name ASC
      LIMIT :intCount
    ];

    for (Product2 objProduct : listProducts) {
      System.debug('Product: ' + objProduct);
      ProductWrapper objWrap = new ProductWrapper(
        objProduct.Name,
        objProduct.ProductCode
      );
      System.debug('Product Object: ' + objWrap);
      listProductWraps.add(objWrap);
    }

    ProductResponse productResponse = new ProductResponse();
    productResponse.availableProducts = listProductWraps;
    System.debug('Product Responses: ' + productResponses);
    productResponses.add(productResponse);
    System.debug('Product Responses After Adding: ' + productResponses);

    return productResponses;
  }

  public class ProductRequest {
    @InvocableVariable
    public String Name;
    @InvocableVariable
    public Integer Count;
  }

  public class ProductResponse {
    @InvocableVariable
    public List<ProductWrapper> availableProducts;
  }

  public class ProductWrapper {
    @InvocableVariable
    public String productName;

    @InvocableVariable
    public String productCode;

    public ProductWrapper(String productName, String productCode) {
      this.productName = productName;
      this.productCode = productCode;
    }
  }
}
