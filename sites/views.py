import json
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
from sites.models import UserSite,SiteData,Site
from django.db.models.functions import Cast
from django.db.models.functions import TruncMonth, TruncYear, TruncSecond
from django.db.models import DateTimeField,IntegerField,CharField
from django.db.models.functions import ExtractYear



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
    import pdb
    pdb.set_trace()
    page_view_queryset = SiteData.objects.filter(name="PageView", user=request.user.id,site=pk).order_by('eventDate')
    like_count_queryset = SiteData.objects.filter(name="LikeCount", user=request.user.id,site=pk).order_by('eventDate')
    
    site_info = Site.objects.filter(id=pk)[0]
    page_view_instantaneous_values_list = []
    page_view_eventDate_list = []
    page_view_lifetime_value_list = []

    like_count_instantaneous_values_list = []
    like_count_eventDate_list = []
    like_count_lifetime_value_list = []

    for entry in page_view_queryset:
        page_view_instantaneous_values_list.append(entry.instantaneous_value)
        page_view_eventDate_list.append(entry.eventDate.isoformat())
        page_view_lifetime_value_list.append(entry.lifetime_value)

    for entry in like_count_queryset:
        like_count_instantaneous_values_list.append(entry.instantaneous_value)
        like_count_eventDate_list.append(entry.eventDate.isoformat())
        like_count_lifetime_value_list.append(entry.lifetime_value)

    context = {
        "site_info": site_info,
        "page_view_instantaneous_values_list": json.dumps(page_view_instantaneous_values_list),
        "page_view_event_data_list": json.dumps(page_view_eventDate_list),
        "page_view_lifetime_value_list": json.dumps(page_view_lifetime_value_list),
        "like_count_instantaneous_values_list": json.dumps(like_count_instantaneous_values_list),
        "like_count_event_data_list": json.dumps(like_count_eventDate_list),
        "like_count_lifetime_value_list": json.dumps(like_count_lifetime_value_list)
    }
    return render(request, 'sites/site_detail.html',context)