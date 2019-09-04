from django.db import models
from django.utils import timezone
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser, PermissionsMixin) 
from django.core.validators import RegexValidator
from enum import Enum

class UserManager(BaseUserManager):
    """[ Creating UserManager class from BaseUserManager
    (overridding create_user and create_superuser)
    so that users can be created using email instead of
    user_name.]

    Arguments:
        BaseUserManager { } -- []

    Raises:
        ValueError: [if email not given will raise value error]

    Returns:
        [User] -- [return newly created user object]
    """

    def create_user(self, email, password=None, **extra_fields):

        if not email:
            raise ValueError("The given email must be set")

        now = timezone.now()
        email = UserManager.normalize_email(email)
        user = self.model(email=email,
                          is_staff=False,
                          is_active=True,
                          is_superuser=False,
                          last_login=now,
                          created_at=now,
                          **extra_fields
                          )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        superuser = self.create_user(email, password, **extra_fields)
        superuser.is_staff = True
        superuser.is_active = True
        superuser.is_superuser = True
        superuser.is_email_verified = True
        superuser.save(using=self._db)
        return superuser


class User(AbstractBaseUser, PermissionsMixin):
    """[ User info are stored in User models
    ]

    Arguments:
        AbstractBaseUser {} -- []
        PermissionsMixin {} -- []

    Returns:
        [User] -- [return newly created user object]
    """
    class UserType(Enum):

        Developer = 0
        Reviewer = 1

        @classmethod
        def as_tuple(cls):
            return ((item.value, item.name.replace('_', ' ')) for item in cls)
    
    email = models.EmailField(unique=True)
    full_name = models.CharField(max_length=1024,blank=True,null=True)
    date_of_birth =  models.DateField(blank=True, null=True)
    address  = models.TextField(blank=True,null=True)
    mobile_num = models.CharField(max_length=12,blank=True,null=True)
    company_name = models.CharField(max_length=512,blank=True,null=True)
    city  =  models.CharField(max_length=512,blank=True,null=True)
    state =  models.CharField(max_length=512,blank=True, null=True)
    zip_code = models.CharField(max_length=10,blank=True,null=True)
    user_type = models.IntegerField(blank=True,null=True,choices=UserType.as_tuple())
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)
    is_email_verified = models.BooleanField(default=True)
    created_at = models.DateTimeField(blank=True,null=True,auto_now_add=True)

    USERNAME_FIELD = 'email'

    def get_full_name(self):
        return self.full_name

    objects = UserManager()
