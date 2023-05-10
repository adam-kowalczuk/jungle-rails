/* eslint-disable no-undef */

describe("Products", () => {
  it("loads the home page", () => {
    cy.visit("/");
  });
  it("should go to the product page when you click on a product", () => {
    cy.get(".products article").first().click();
  });
});
