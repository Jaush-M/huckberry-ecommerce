from django.contrib import admin
from django.contrib.auth import get_user_model

from .models import User, Product, Cart, CartItem, Order, OrderItem

User = get_user_model()

admin.site.register(User)
admin.site.register(Product)
admin.site.register(Cart)
admin.site.register(CartItem)
admin.site.register(Order)
admin.site.register(OrderItem)
