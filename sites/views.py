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
data =  [
        ['Year', 'Sales', 'Expenses'],
        [2004, 1000, 400],
        [2005, 1170, 460],
        [2006, 660, 1120],
        [2007, 1030, 540]
    ]
from graphos.sources.simple import SimpleDataSource
from graphos.renderers.gchart import LineChart
from graphos.renderers import flot
from graphos.sources.model import ModelDataSource



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
    queryset = SiteData.objects.filter(user=request.user.id,site=pk)
    site_data = queryset
    site_info = Site.objects.filter(id=pk)[0]
    #chart = LineChart(SimpleDataSource(data=data),height=500, width=600)
    data_source = ModelDataSource(queryset, fields=['instantaneous_value', 'eventDate'])
    chart = flot.LineChart(data_source,options={"title":"Amazon"})
    context = {
        "site_data": site_data,
        "site_info": site_info,
        "chart":chart
    }
    return render(request, 'sites/site_detail.html',context)