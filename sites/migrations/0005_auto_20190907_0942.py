# Generated by Django 2.2.4 on 2019-09-07 09:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sites', '0004_auto_20190903_1820'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sitedata',
            name='name',
            field=models.CharField(blank=True, choices=[('PageView', 'Page View'), ('LikeCount', 'Like Count')], max_length=255, null=True),
        ),
    ]
