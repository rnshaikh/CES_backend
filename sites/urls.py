from django.urls import path
from sites import views

urlpatterns = [
    path('sites/', views.getsiteobject, name="get_site_object"),
    path('sites/<int:pk>', views.getdataobject, name="get_data_object")     
]