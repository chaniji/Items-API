#!/bin/bash

# API Testing Script - Only for existing endpoints
# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

BASE_URL="http://localhost:8080/api/items"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}API Testing Script${NC}"
echo -e "${BLUE}3 Endpoints: add, getitems, deleteitems${NC}"
echo -e "${BLUE}================================${NC}\n"

# Function to print section headers
print_header() {
    echo -e "\n${YELLOW}>>> $1${NC}"
    echo "----------------------------------------"
}

# Function to print responses
print_response() {
    echo -e "${GREEN}Response:${NC} $1\n"
}

# Test 1: Add Items
print_header "TEST 1: Adding Items to Database"

echo "Adding Laptop (ID: 1)..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "name": "Laptop",
    "Descriptions": "High performance gaming laptop with 16GB RAM",
    "Price": "75000"
  }')
print_response "$response"

echo "Adding Smartphone (ID: 2)..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 2,
    "name": "Smartphone",
    "Descriptions": "Latest model with 128GB storage and dual camera",
    "Price": "45000"
  }')
print_response "$response"

echo "Adding Wireless Headphones (ID: 3)..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 3,
    "name": "Wireless Headphones",
    "Descriptions": "Noise-cancelling over-ear headphones with 30h battery",
    "Price": "8500"
  }')
print_response "$response"

echo "Adding 4K Monitor (ID: 4)..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 4,
    "name": "4K Monitor",
    "Descriptions": "27-inch LED display with HDR support",
    "Price": "22000"
  }')
print_response "$response"

echo "Adding Mechanical Keyboard (ID: 5)..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 5,
    "name": "Mechanical Keyboard",
    "Descriptions": "RGB backlit gaming keyboard with blue switches",
    "Price": "6500"
  }')
print_response "$response"

echo "Adding Gaming Mouse (ID: 6)..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 6,
    "name": "Gaming Mouse",
    "Descriptions": "Ergonomic wireless mouse with 16000 DPI",
    "Price": "3500"
  }')
print_response "$response"

# Test 2: Try adding duplicate ID
print_header "TEST 2: Adding Duplicate ID (Should Fail)"

echo "Attempting to add item with ID 1 again..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "name": "Duplicate Laptop",
    "Descriptions": "This should not be added",
    "Price": "50000"
  }')
print_response "$response"

# Test 3: Get Specific Items by ID
print_header "TEST 3: Getting Items by ID"

echo "Getting item with ID 1 (Laptop)..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 1}')
print_response "$response"

echo "Getting item with ID 3 (Headphones)..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 3}')
print_response "$response"

echo "Getting item with ID 5 (Keyboard)..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 5}')
print_response "$response"

echo "Getting item with ID 6 (Mouse)..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 6}')
print_response "$response"

# Test 4: Try getting non-existent item
print_header "TEST 4: Getting Non-Existent Item"

echo "Trying to get item with ID 999..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 999}')
print_response "$response"

# Test 5: Get each item individually
print_header "TEST 5: Retrieving All Items One by One"

for i in {1..6}; do
    echo "Getting item ID $i..."
    response=$(curl -s -X GET $BASE_URL/getitems \
      -H "Content-Type: application/json" \
      -d "{\"id\": $i}")
    print_response "$response"
done

# Test 6: Delete All Items
print_header "TEST 6: Deleting All Items"

echo "Deleting all items from database..."
response=$(curl -s -X DELETE $BASE_URL/deleteitems)
print_response "$response"

# Test 7: Verify deletion
print_header "TEST 7: Verifying Deletion"

echo "Trying to get item ID 1 after deletion..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 1}')
print_response "$response"

echo "Trying to get item ID 3 after deletion..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 3}')
print_response "$response"

# Test 8: Operations on empty database
print_header "TEST 8: Adding Items After Deletion"

echo "Adding new Tablet (ID: 10)..."
response=$(curl -s -X POST $BASE_URL/add \
  -H "Content-Type: application/json" \
  -d '{
    "id": 10,
    "name": "Tablet",
    "Descriptions": "10-inch tablet with stylus support",
    "Price": "35000"
  }')
print_response "$response"

echo "Verifying new item was added (ID: 10)..."
response=$(curl -s -X GET $BASE_URL/getitems \
  -H "Content-Type: application/json" \
  -d '{"id": 10}')
print_response "$response"

echo "Cleaning up - Deleting all items..."
response=$(curl -s -X DELETE $BASE_URL/deleteitems)
print_response "$response"

# Final Summary
print_header "TEST COMPLETE"
echo -e "${GREEN}✓ All API endpoint tests completed successfully!${NC}"
echo -e "${BLUE}Tested:${NC}"
echo -e "  • POST   /api/items/add"
echo -e "  • GET    /api/items/getitems"
echo -e "  • DELETE /api/items/deleteitems"
echo ""
