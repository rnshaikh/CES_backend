from django.contrib import admin
from .models import User
# Register your models here.

class UserAdmin(admin.ModelAdmin):
    list_display = ('email', 'full_name', 
        'date_of_birth','city','state','is_active')
    ordering = ('full_name',)
    search_fields = ('full_name', 'email')


admin.site.register(User, UserAdmin)