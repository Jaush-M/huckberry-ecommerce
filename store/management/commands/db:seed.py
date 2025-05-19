from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model
from store.models import Product, Cart, CartItem
import random
from faker import Faker

fake = Faker()
User = get_user_model()


class Command(BaseCommand):
    help = "Seed the database with test users, products, carts, and cart items"

    def handle(self, *args, **kwargs):
        self.stdout.write("Seeding data...")
        self.create_users()
        self.create_products()
        self.create_carts()
        self.stdout.write(self.style.SUCCESS("Database seeded successfully."))

    def create_users(self):
        for i in range(5):
            User.objects.create_user(
                username=f"user{i}",
                email=f"user{i}@example.com",
                password="password123",
            )

    def create_products(self):
        PRODUCTS = [
            {
                "name": "Sierra Trail Sunglasses",
                "description": "Classic outdoor frame with polarized lenses.",
                "price": 129.99,
                "stock": 30,
                "image_src": "sierra.jpg",
            },
            {
                "name": "Urban Voyager Shades",
                "description": "Stylish city-ready sunglasses with UV protection.",
                "price": 149.99,
                "stock": 20,
                "image_src": "voyager.jpg",
            },
            {
                "name": "Alpine Edge Polarized",
                "description": "Built for high-altitude adventures.",
                "price": 179.99,
                "stock": 15,
                "image_src": "alpine.jpg",
            },
            {
                "name": "Beach Breeze Sunglasses",
                "description": "Comfortable beach sunglasses for relaxation.",
                "price": 99.99,
                "stock": 40,
                "image_src": "beach.jpg",
            },
            {
                "name": "Urban Explorer Shades",
                "description": "Stylish city sunglasses for urban adventures.",
                "price": 129.99,
                "stock": 25,
                "image_src": "explorer.jpg",
            },
            {
                "name": "Mountain Trekker Sunglasses",
                "description": "Durable sunglasses for mountain trekking.",
                "price": 159.99,
                "stock": 10,
                "image_src": "trekker.jpg",
            },
            {
                "name": "Desert Mirage Shades",
                "description": "Lightweight sunglasses for desert adventures.",
                "price": 119.99,
                "stock": 35,
                "image_src": "mirage.jpg",
            },
            {
                "name": "Coastal Cruiser Sunglasses",
                "description": "Perfect for coastal drives and beach days.",
                "price": 139.99,
                "stock": 20,
                "image_src": "cruiser.jpg",
            },
        ]

        for data in PRODUCTS:
            Product.objects.create(
                name=data["name"],
                description=data["description"],
                price=data["price"],
                stock=data["stock"],
                image=data["image_src"],
            )

    def create_carts(self):
        for user in User.objects.all():
            cart, _ = Cart.objects.get_or_create(user=user)
            for product in Product.objects.order_by("?")[:3]:
                CartItem.objects.create(
                    cart=cart, product=product, quantity=random.randint(1, 3)
                )
