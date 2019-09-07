from django.urls import path
from user_auth import views

urlpatterns = [

    path('register/',
         views.CreateUserView.as_view(), name='user_register'),
    
    path('login/',
         views.login_view, name='user_login'),

    path('logout/',views.logout_view, name="user_logout"),

    path('profile/update/',views.user_update ,name='user_update'),

    path('forgot_password/',views.forgot_password ,name='forgot_password')
     
]

