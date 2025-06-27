import { LightningElement, api } from "lwc";

export default class ProductSearchDetails extends LightningElement {
  @api value; // This property will receive the data from Agentforce

  columns = [
    { label: "Product Name", fieldName: "productName" },
    { label: "Product Code", fieldName: "productCode" }
  ];

  get products() {
    let tempProducts = [];

    // Ensure 'value' exists and is an array before iterating
    if (this.value && Array.isArray(this.value)) {
      for (const element of this.value) {
        console.log(element);
        tempProducts.push({
          productName: element.productName,
          productCode: element.productCode
        });
      }
    }
    return tempProducts;
  }
}
