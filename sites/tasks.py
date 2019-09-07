from celery.task.schedules import crontab
from celery.decorators import periodic_task
from celery import task
from sites.models import Site,UserSite,SiteData
from django.utils import timezone
from ces_backend.celery import app


@app.task
def generate_page_view_data_object():
    print("First task")
    user_sites = SiteData.objects.filter(name="PageView").distinct('user')
    print("User site........", user_sites)
    for user_site in user_sites:
        
        user_last_site = SiteData.objects.filter().order_by('-id')
        print("User last sites",user_last_site)
        if user_last_site:
            ins_value = user_last_site[0].instantaneous_value
            li_value = user_last_site[0].lifetime_value
            user=user_site.user
            site = user_site.site
            name = 'PageView'
            instantaneous_value = ins_value+100
            lifetime_value= li_value+10
            eventDate = timezone.now()
            new_user_site = SiteData.objects.create(user=user,site=site,name=name,
                            instantaneous_value=instantaneous_value,lifetime_value=lifetime_value,eventDate=eventDate)
            new_site = new_user_site.save()
            print("New site page", new_site)

@app.task
def generate_like_count_data_object():
    print("2nd task")
    user_sites = SiteData.objects.filter(name="LikeCount").distinct('user')
    print("User Sites", user_sites)
    for user_site in user_sites:
        user_last_site = SiteData.objects.filter().order_by('-id')
        print("User last sites", user_last_site)
        if user_last_site:
            ins_value = user_last_site[0].instantaneous_value
            li_value = user_last_site[0].lifetime_value
            user=user_site.user
            site = user_site.site
            name = 'LikeCount'
            instantaneous_value = ins_value+100
            lifetime_value= li_value+10
            eventDate = timezone.now()
            new_user_site = SiteData.objects.create(user=user,site=site,name=name,
                            instantaneous_value=instantaneous_value,lifetime_value=lifetime_value,eventDate=eventDate)
            new_site = new_user_site.save()
            print("NewLikecount", new_site)

