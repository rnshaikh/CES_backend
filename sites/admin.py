from django.contrib import admin
from .models import Site, UserSite
# Register your models here.

class SiteAdmin(admin.ModelAdmin):
    list_display = ('name', 'status')
    ordering = ('name',)
    search_fields = ('name',)


class UserSiteAdmin(admin.ModelAdmin):
    list_display = ('user', 'site','created_at',
                    'updated_at','created_by','updated_by','is_valid')
    ordering = ('user','site','is_valid')
    search_fields = ('user',)

admin.site.register(Site, SiteAdmin)
admin.site.register(UserSite, UserSiteAdmin)
