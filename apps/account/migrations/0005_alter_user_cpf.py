# Generated by Django 4.2.2 on 2023-07-06 08:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0004_alter_user_cpf'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='cpf',
            field=models.CharField(blank=True, max_length=33, null=True, verbose_name='CPF'),
        ),
    ]