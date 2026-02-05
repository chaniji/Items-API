# Items Management REST API

A simple Spring Boot REST API for managing items using in-memory storage.

## Live Demo

API is deployed at: https://itemsapi-54se.onrender.com

## Project Structure

src/main/java/com/chan/Items/
    Controllers/
        MainController.java
    DTO/
        Items.java
    ServiceLayer/
        Logics.java
        JsonResponse.java
    DemoApplicationTests.java

## How to Run Locally

1. Clone the repository
2. Run: mvn spring-boot:run
3. API runs at: http://localhost:8080

## API Endpoints

Base URL: https://itemsapi-54se.onrender.com/api/items

### 1. Add Item

POST /api/items/add

Request:
{
  "id": 1,
  "name": "Laptop",
  "descriptions": "High-performance laptop",
  "price": "75000"
}

Response:
{"message": "Item Successfully Added"}

### 2. Get Item

GET /api/items/getitems

Request:
{
  "id": 1
}

Response:
{
  "id": 1,
  "name": "Laptop",
  "descriptions": "High-performance laptop",
  "price": "₹:75000"
}

### 3. Delete All Items

DELETE /api/items/deleteitems

Response:
{"message": "Successfully deleted"}

## cURL Examples

Add Item:
curl -X POST https://itemsapi-54se.onrender.com/api/items/add -H "Content-Type: application/json" -d '{"id":1,"name":"Laptop","descriptions":"Gaming laptop","price":"75000"}'

Get Item:
curl -X GET https://itemsapi-54se.onrender.com/api/items/getitems -H "Content-Type: application/json" -d '{"id":1}'

Delete All:
curl -X DELETE https://itemsapi-54se.onrender.com/api/items/deleteitems
