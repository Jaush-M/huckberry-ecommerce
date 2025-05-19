from django.shortcuts import redirect, render
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required

from .forms import UserCreationForm, ProfileForm, ProductForm
from .models import Product, Order


def home(request):
    return render(request, "products.html", {"products": Product.objects.all()})


def signup_view(request):
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("home")
    else:
        form = UserCreationForm()
    return render(request, "auth/signup.html", {"form": form})


@login_required
def profile_view(request):
    if request.method == "POST":
        form = ProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
    else:
        form = ProfileForm(instance=request.user)

    return render(request, "auth/profile.html", {"form": form})


@staff_member_required
def manage_orders(request):
    orders = Order.objects.select_related("user").prefetch_related("items")
    return render(request, "admin/orders.html", {"orders": orders})


@staff_member_required
def product_list(request):
    products = Product.objects.all()
    return render(request, "admin/products/list.html", {"products": products})


@staff_member_required
def product_create(request):
    form = ProductForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        form.save()
        return redirect("admin_product_list")
    return render(request, "admin/products/form.html", {"form": form})


@staff_member_required
def product_edit(request, pk):
    product = Product.objects.get(pk=pk)
    form = ProductForm(request.POST or None, request.FILES or None, instance=product)
    if form.is_valid():
        form.save()
        return redirect("admin_product_list")
    return render(request, "admin/products/form.html", {"form": form})


@staff_member_required
def product_delete(request, pk):
    Product.objects.get(pk=pk).delete()
    return redirect("admin_product_list")


@login_required
def order_history(request):
    orders = Order.objects.filter(user=request.user).order_by("-created_at")
    return render(request, "store/order_history.html", {"orders": orders})


def about_page(request):
    return render(request, "static/about.html")


def privacy_page(request):
    return render(request, "static/privacy.html")
