import pandas as pd
import numpy as np
from datetime import datetime
import random
import os

os.makedirs("data", exist_ok=True)

new_orders = pd.DataFrame({
    "order_id": np.random.randint(2000, 999999, 50),
    "customer_id": np.random.randint(1, 101, 50),
    "order_date": datetime.today().date(),
    "status": "Completed"
})

new_orders.to_csv("data/orders_incremental.csv", index=False)

order_items = pd.DataFrame({
    "order_id": new_orders.order_id,
    "product_id": np.random.randint(101, 121, 50),
    "quantity": np.random.randint(1, 5, 50)
})

order_items.to_csv("data/order_items_incremental.csv", index=False)

print("Incremental data generated")