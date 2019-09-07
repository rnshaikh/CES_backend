from __future__ import absolute_import, unicode_literals
import os
from celery import Celery
from django.conf import settings
#from sites import tasks
# set the default Django settings module for the 'celery' program.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ces_backend.settings')

app = Celery('ces_backend')

# Using a string here means the worker don't have to serialize
# the configuration object to child processes.
# - namespace='CELERY' means all celery-related configuration keys
#   should have a `CELERY_` prefix.
app.config_from_object('django.conf:settings',namespace='CELERY')

# Load task modules from all registered Django app configs.
app.autodiscover_tasks(settings.INSTALLED_APPS)

# @app.on_after_configure.connect
# def setup_periodic_tasks(sender, **kwargs):
#     # Calls test('hello') every 10 seconds.
#     sender.add_periodic_task(10.0, hello_test.s('hello'), name='add every 10')


# @app.task
# def hello_test(arg):
#     print(arg)

# app.conf.CELERY_BEAT_SCHEDULE = {
#     'add-every-30':{
#         'task': 'task.generate_page_view_data_object',
#         'schedule': 10.0
#     }

# }