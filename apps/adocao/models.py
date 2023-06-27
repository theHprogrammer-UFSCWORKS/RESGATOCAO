from django.db import models

from apps.account.models import Endereco, User


# upar a foto para o diretório animal_photos com uma pasta para cada animal
def upload_to_animal_avatar(instance, filename):
    return 'animal_photos/{0}/{1}'.format(instance.nome, filename)

def upload_to_animal_photos(instance, filename):
    return 'animal_photos/{0}/{1}'.format(instance.animal.nome, filename)



class TipoAnimal(models.Model):
    descricao = models.CharField('Descrição', max_length=30)

    def __str__(self):
        return self.descricao


class Raca(models.Model):
    tipo_animal = models.ForeignKey(TipoAnimal, on_delete=models.CASCADE)
    descricao = models.CharField('Descrição', max_length=30)

    def __str__(self):
        return self.descricao


class Comando(models.Model):
    descricao = models.CharField('Descrição', max_length=30)

    def __str__(self):
        return self.descricao


class OutrasCaracteristica(models.Model):
    descricao = models.CharField('Descrição', max_length=30)

    def __str__(self):
        return self.descricao


class FaixaIdade(models.TextChoices):
    ATE_1_ANO = ('ate_1_ano', 'Até 1 ano')
    um_a_tres_anos = ('um_a_tres_anos', '1 a 3 anos')
    tres_a_cinco_anos = ('tres_a_cinco_anos', '3 a 5 anos')
    cinco_a_dez_anos = ('cinco_a_dez_anos', '5 a 10 anos')
    dez_a_quinze_anos = ('dez_a_quinze_anos', '10 a 15 anos')
    quinze_a_vinte_anos = ('quinze_a_vinte_anos', '15 a 20 anos')


class Sexo(models.TextChoices):
    MACHO = ('macho', 'Macho')
    FEMEA = ('femea', 'Fêmea')


class Animal(models.Model):
    nome = models.CharField('Nome', max_length=100)
    adotado = models.BooleanField('Adotado', default=False)
    raca = models.ForeignKey(Raca, on_delete=models.CASCADE)
    avatar = models.ImageField('Avatar', upload_to=upload_to_animal_avatar)
    idade = models.CharField('Idade',
                             max_length=20, choices=FaixaIdade.choices, blank=True, default=None)
    sexo = models.CharField('Sexo',
                            max_length=10, choices=Sexo.choices, blank=True, default=None)
    peso = models.FloatField('Peso')
    cor = models.CharField('Cor', max_length=20)
    cor_olho = models.CharField('Cor do olho', max_length=20)
    sobre = models.TextField('Sobre')
    comandos = models.ManyToManyField(Comando, blank=True)
    outras_caracteristicas = models.ManyToManyField(
        OutrasCaracteristica, blank=True)

    def __str__(self):
        return self.nome


class FotoAnimal(models.Model):
    animal = models.ForeignKey(Animal, on_delete=models.CASCADE)
    foto = models.ImageField('Foto', upload_to=upload_to_animal_photos)

    def __str__(self):
        return self.animal.nome


class AnimalResgate(models.Model):
    data_resgate = models.DateField('Data do resgate', primary_key=True)
    local = models.ForeignKey(Endereco, on_delete=models.CASCADE)
    animal = models.ForeignKey(Animal, on_delete=models.CASCADE)
    descricao = models.CharField('Descrição', max_length=255)

    def __str__(self):
        return self.animal.nome


class AdocaoSteps(models.TextChoices):
    entrevista = ('entrevista', 'Entrevista')


class Adocao(models.Model):
    data_adocao = models.DateTimeField('Data da adoção', auto_now_add=True)
    data_inicio = models.DateTimeField(
        'Data do início da adoção', null=True, blank=True)
    animal = models.ForeignKey(Animal, on_delete=models.CASCADE)
    adotante = models.ForeignKey(User, on_delete=models.CASCADE)
    etapa = models.CharField('Etapa da adoção',
                             max_length=20, choices=AdocaoSteps.choices, default=AdocaoSteps.entrevista)

    def __str__(self):
        return self.animal.nome + ' - ' + self.adotante.user.first_name + ' ' + self.adotante.user.last_name

    class Meta:
        unique_together = ('animal', 'adotante')
