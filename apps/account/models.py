import re
from datetime import timezone
from urllib.parse import quote

from django.conf import settings
from django.contrib.auth.models import (AbstractBaseUser, BaseUserManager,
                                        PermissionsMixin)
from django.core import validators
from django.core.mail import send_mail
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _


def upload_to_user_photos(instance, filename):
    return 'user_photos/{0}/{1}'.format(instance.username, filename)


class Endereco(models.Model):
    cep = models.CharField('CEP', max_length=9)
    uf = models.CharField('UF', max_length=2)
    bairro = models.CharField('Bairro', max_length=150)
    endereco = models.CharField('Endereço', max_length=150)
    cidade = models.CharField('Cidade', max_length=150)
    numero = models.IntegerField('Número')
    complemento = models.CharField('Complemento', max_length=100, blank=True, null=True)
    is_principal = models.BooleanField('Principal', default=False)

    def __str__(self):
        #return f'{self.numero}, {self.cidade} - {self.uf}'
        #returning every information 
        return f'{self.cep}, {self.uf}, {self.bairro}, {self.endereco}, {self.cidade}, {self.numero}, {self.complemento}, {self.is_principal}'



class UserManager(BaseUserManager):
    def _create_user(self, username, email, password, is_staff, is_superuser, **extra_fields):
        now = timezone.now()
        if not username:
            raise ValueError(_('The given username must be set'))
        email = self.normalize_email(email)
        user = self.model(username=username, email=email, is_staff=is_staff, is_active=True,
                          is_superuser=is_superuser, last_login=now, date_joined=now, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, username, email=None, password=None, **extra_fields):
        return self._create_user(username, email, password, False, False, **extra_fields)

    def create_superuser(self, username, email, password, **extra_fields):
        user = self._create_user(
            username, email, password, True, True, **extra_fields)
        user.is_active = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(_('username'), max_length=15, unique=True, help_text=_('Required. 15 characters or fewer. Letters, numbers and @/./+/-/_ characters'),
                                validators=[validators.RegexValidator(re.compile('^[\w.@+-]+$'), _('Enter a valid username.'), _('invalid'))])
    first_name = models.CharField(_('first name'), max_length=30)
    last_name = models.CharField(_('last name'), max_length=30)
    email = models.EmailField(_('email address'), max_length=255, unique=True)
    is_staff = models.BooleanField(_('staff status'), default=False, help_text=_(
        'Designates whether the user can log into this admin site.'))
    is_active = models.BooleanField(_('active'), default=True, help_text=_(
        'Designates whether this user should be treated as active. Unselect this instead of deleting accounts.'))
    date_joined = models.DateTimeField(_('date joined'), default=timezone.now)
    is_trusty = models.BooleanField(_('trusty'), default=False, help_text=_(
        'Designates whether this user has confirmed his account.'))

    # New fields
    birth_date = models.DateField('Data de nascimento', null=True, blank=True)
    occupation = models.CharField(
        'Ocupação', max_length=150, null=True, blank=True)
    cpf = models.CharField('CPF', max_length=11, null=True, blank=True)
    phone = models.CharField('Telefone', max_length=13,
                             null=True, blank=True)  # '11 99999-9999
    avatar = models.ImageField(
        'Avatar', upload_to=upload_to_user_photos, null=True, blank=True)
    addresses = models.ManyToManyField(
        Endereco, verbose_name='Endereços', blank=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    objects = UserManager()

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')

    def get_full_name(self):
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        return self.first_name

    def email_user(self, subject, message, from_email=None):
        send_mail(subject, message, from_email, [self.email])


# class Adotante(models.Model):
#     user = models.OneToOneField(get_user_model(), on_delete=models.CASCADE)
#     idade = models.IntegerField('Idade')
#     ocupacao = models.CharField('Ocupação', max_length=150)
#     cpf = models.CharField('CPF', max_length=11)
#     telefone = models.CharField('Telefone', max_length=13)  # '11 99999-9999
#     endereco = models.ForeignKey(Endereco, on_delete=models.CASCADE)
#     avatar = models.ImageField('Avatar', upload_to=upload_to_adotante_photos)

#     def __str__(self):
#         return self.user.first_name + ' ' + self.user.last_name
