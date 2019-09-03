from django.db import models
from django.utils import timezone
from enum import Enum
from user_auth.models import User


class Site(models.Model):

    class SiteStatus(Enum):
        Active = 1
        Proposed = 2
        Inactive = 0
        
        @classmethod
        def as_tuple(cls):
            return ((item.value, item.name.replace('_', ' ')) for item in cls)

    name = models.CharField(max_length=1024)
    description = models.TextField(blank=True,null=True)
    status = models.IntegerField(choices=SiteStatus.as_tuple())

    def __str__(self):
        return self.name


class UserSite(models.Model):

    user = models.ForeignKey(User,
                related_name="user_affiliated_site",on_delete=models.CASCADE)
    site = models.ForeignKey(Site,on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True,blank=True,null=True)
    updated_at = models.DateTimeField(auto_now=True,blank=True,null=True)
    created_by = models.ForeignKey(User,related_name='user_site_created_user',on_delete=models.DO_NOTHING)
    updated_by = models.ForeignKey(User,blank=True,null=True,related_name='user_site_updated_user',on_delete=models.DO_NOTHING)
    is_valid = models.BooleanField(default=True)


class SiteData(models.Model):
    
    user = models.ForeignKey(User,
                related_name="user_site_data",on_delete=models.CASCADE)
    site = models.ForeignKey(Site,related_name="site_user",on_delete=models.CASCADE)
    measurement = models.IntegerField()
    eventDate = models.DateTimeField()