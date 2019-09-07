import json
from django.shortcuts import render
from django.conf import settings
from django.contrib import messages
from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy,reverse
from user_auth.models import User
from sites.models import UserSite,SiteData,Site


@login_required(login_url="/user/login")
def getsiteobject(request):
    """
        This view is used to get sites object related to particular users depending on developer
        get its object and if examiner gets all the objects of all developer.

    """
    if(request.user.user_type==1):
        active_site= UserSite.objects.filter(site__status=1).distinct('site')
        propsed_site = UserSite.objects.filter(site__status=2).distinct('site')
        inactive_site = UserSite.objects.filter(site__status=0).distinct('site')    
    else:
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

@login_required(login_url="/user/login")
def getdataobject(request,pk):

    """ 
    Get data object is used to get data perticular sites related to login user.
    """
    
    page_view_queryset =[]
    like_count_queryset=[]

    if(request.user.user_type==0):
        page_view_queryset = SiteData.objects.filter(name = settings.PAGE_VIEW, user=request.user.id,site=pk).order_by('eventDate')
        like_count_queryset = SiteData.objects.filter(name = settings.LIKE_COUNT, user=request.user.id,site=pk).order_by('eventDate')
    
    elif (request.user.user_type==1):
        page_view_queryset = SiteData.objects.filter(name= settings.PAGE_VIEW,site=pk).order_by('eventDate')
        like_count_queryset = SiteData.objects.filter(name= settings.LIKE_COUNT,site=pk).order_by('eventDate')


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