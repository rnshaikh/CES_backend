from django.shortcuts import render
from django import forms
from django.conf import settings
from django.contrib import messages
from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from django.contrib.auth import (authenticate, login, logout,)
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy,reverse
from user_auth.models import User
from sites.models import UserSite,SiteData

def getsiteobject(request):
    
    active_site = UserSite.objects.filter(user=request.user.id,site__status=1)
    propsed_site = UserSite.objects.filter(user=request.user.id,site__status=2)
    inactive_site = UserSite.objects.filter(user=request.user.id,site__status=0)
    context = {
        "active_sites" : active_site,
        "inactive_sites": inactive_site,
        "proposed_sites": propsed_site
    }
    print("Context", context)
    return render(request, 'sites/dashboard.html',context)


def getdataobject(request,pk):
    site_data = SiteData.objects.filter(user=request.user.id,site=pk)
    context = {
        "site_data": site_data
    }
    return render(request, 'sites/site_detail.html',context)