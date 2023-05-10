/* eslint-disable no-undef */

describe("Add to Cart", () => {
  it("loads the home page", () => {
    cy.visit("/");
  });
  it("should add an item to the cart", () => {
    cy.contains("My Cart (0)").should("be.visible");
    cy.get(".products article").contains("Add").click({ force: true });
    cy.contains("My Cart (1)").should("be.visible");
  });
});
