from django.urls import path
from django.contrib.auth import views as auth_views

from . import views
from . import cart_views
from .forms import AuthenticationForm

urlpatterns = [
    path("", views.home, name="home"),
    ###
    # Cart URLs
    ###
    path("cart/", cart_views.view_cart, name="view_cart"),
    path("cart/add/<int:product_id>/", cart_views.add_to_cart, name="add_to_cart"),
    path(
        "cart/update/<int:item_id>/<str:action>/",
        cart_views.update_cart,
        name="update_cart",
    ),
    path(
        "cart/remove/<int:item_id>/",
        cart_views.remove_from_cart,
        name="remove_from_cart",
    ),
    path("checkout/", cart_views.checkout, name="checkout"),
    ###
    # Authentication URLs
    ###
    path("signup/", views.signup_view, name="signup"),
    path(
        "accounts/login/",
        auth_views.LoginView.as_view(
            template_name="auth/login.html",
            authentication_form=AuthenticationForm,
        ),
        name="login",
    ),
    path("logout/", auth_views.LogoutView.as_view(next_page="login"), name="logout"),
    path("accounts/profile/", views.profile_view, name="profile"),
    ###
    # Admin URLs
    ###
    path("admin/products/", views.product_list, name="admin_product_list"),
    path("admin/products/create/", views.product_create, name="admin_product_create"),
    path(
        "admin/products/<int:pk>/edit/", views.product_edit, name="admin_product_edit"
    ),
    path(
        "admin/products/<int:pk>/delete/",
        views.product_delete,
        name="admin_product_delete",
    ),
    path("manage-orders/", views.manage_orders, name="manage_orders"),
    ###
    # Static URLs
    ###
    path("about/", views.about_page, name="about"),
    path("privacy/", views.privacy_page, name="privacy"),
]
