from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render
from .models import Cart, CartItem, Order, OrderItem, Product


@login_required
def view_cart(request):
    cart, _ = Cart.objects.get_or_create(user=request.user)
    items = cart.cartitem_set.select_related("product")
    return render(request, "cart.html", {"cart": cart, "items": items})


@login_required
def add_to_cart(request, product_id):
    product = Product.objects.get(pk=product_id)
    cart, _ = Cart.objects.get_or_create(user=request.user)
    item, created = CartItem.objects.get_or_create(cart=cart, product=product)
    if not created:
        item.quantity += 1
    item.save()
    return redirect("view_cart")


@login_required
def update_cart(request, item_id, action):
    item = CartItem.objects.get(pk=item_id)
    if action == "inc":
        item.quantity += 1
    elif action == "dec":
        item.quantity = max(1, item.quantity - 1)
    item.save()
    return redirect("view_cart")


@login_required
def remove_from_cart(request, item_id):
    CartItem.objects.get(pk=item_id).delete()
    return redirect("view_cart")


@login_required
def checkout(request):
    cart = Cart.objects.get(user=request.user)
    items = cart.cartitem_set.select_related("product")

    total = sum(item.quantity * item.product.price for item in items)

    order = Order.objects.create(user=request.user, total_amount=total)

    for item in items:
        OrderItem.objects.create(
            order=order,
            product=item.product,
            quantity=item.quantity,
            unit_price=item.product.price,
        )

    # Clear cart
    cart.cartitem_set.all().delete()

    return render(request, "checkout_success.html", {"order": order})
