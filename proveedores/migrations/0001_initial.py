# Generated by Django 4.0.4 on 2022-05-15 23:38

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='RubroEmpresa',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('rubro', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'prove_rubro_empresa',
            },
        ),
    ]
