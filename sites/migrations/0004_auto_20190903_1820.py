# Generated by Django 2.2.4 on 2019-09-03 18:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sites', '0003_sitedata'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sitedata',
            name='measurement',
        ),
        migrations.AddField(
            model_name='sitedata',
            name='instantaneous_value',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sitedata',
            name='lifetime_value',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sitedata',
            name='name',
            field=models.CharField(blank=True, max_length=500, null=True),
        ),
    ]
