# Generated by Django 4.2.2 on 2023-06-27 02:18

import apps.adocao.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adocao', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='animal',
            name='avatar',
            field=models.ImageField(upload_to=apps.adocao.models.upload_to_animal_avatar, verbose_name='Avatar'),
        ),
    ]
