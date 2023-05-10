/* eslint-disable no-undef */

describe("Add to Cart", () => {
  it("loads the home page", () => {
    cy.visit("/");
  });
  it("should add an item to the cart", () => {
    cy.get(":nth-child(1) > div > .button_to > .btn").click({ force: true });
    cy.get(".end-0 > .nav-link").should("have.length", 1);
  });
});
