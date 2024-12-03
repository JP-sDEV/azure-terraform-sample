const request = require("supertest");
const express = require("express");

const app = express();
app.get("/", (req, res) => res.send("Hello, Azure Pipelines and Terraform!"));

describe("GET /", () => {
  it("should return 200 OK", async () => {
    const response = await request(app).get("/");
    expect(response.status).toBe(200);
  });

  it("should return the correct message", async () => {
    const response = await request(app).get("/");
    expect(response.text).toBe("Hello, Azure Pipelines and Terraform!");
  });
});
