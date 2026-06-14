import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["price", "weight", "calories", "item"]

def generate_row():

    return {
        "price": random.randint(50, 500),
        "weight": round(random.uniform(50.0, 600.0), 2),
        "calories": random.randint(100, 1200),
        "item": random.choice(["Бургер", "Пицца", "French Fries", "Наггетсы", "Кола", "Шаурма", "Наполеон"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
