import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

np.random.seed(42)

# Customers
n_customers = 5000
customers = pd.DataFrame({
    "customer_id": range(1, n_customers + 1),
    "name": ["Customer_" + str(i) for i in range(1, n_customers + 1)],
    "city": np.random.choice(["Chennai", "Delhi", "Mumbai", "Bangalore"], n_customers),
    "signup_date": pd.to_datetime("2023-01-01") + pd.to_timedelta(np.random.randint(0, 365, n_customers), unit="D")
})

customers.to_csv("customers.csv", index=False)

# Products
products = pd.DataFrame({
    "product_id": range(101, 151),
    "product_name": ["Product_" + str(i) for i in range(101, 151)],
    "category": np.random.choice(["Electronics", "Furniture", "Clothing"], 50),
    "price": np.random.randint(100, 2000, 50)
})

products.to_csv("products.csv", index=False)

# Orders
n_orders = 20000
orders = pd.DataFrame({
    "order_id": range(1001, 1001 + n_orders),
    "customer_id": np.random.randint(1, n_customers, n_orders),
    "order_date": pd.to_datetime("2024-01-01") + pd.to_timedelta(np.random.randint(0, 365, n_orders), unit="D"),
    "status": np.random.choice(["Completed", "Returned", "Cancelled"], n_orders, p=[0.8, 0.1, 0.1])
})

orders.to_csv("orders.csv", index=False)

# Order Items
order_items = []
for order_id in orders["order_id"]:
    for _ in range(random.randint(1,3)):
        order_items.append([
            order_id,
            random.randint(101,150),
            random.randint(1,5)
        ])

order_items = pd.DataFrame(order_items, columns=["order_id","product_id","quantity"])
order_items.to_csv("order_items.csv", index=False)

print("Data generated successfully!")