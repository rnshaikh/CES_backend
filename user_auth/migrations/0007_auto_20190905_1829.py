# Generated by Django 2.2.4 on 2019-09-05 18:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_auth', '0006_auto_20190902_0816'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='user_type',
            field=models.IntegerField(blank=True, choices=[(0, 'Developer'), (1, 'Reviewer')], null=True),
        ),
    ]
