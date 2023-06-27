from django.contrib import admin

from .models import (Adocao, Animal, AnimalResgate, Comando, FotoAnimal,
                     OutrasCaracteristica, Raca, TipoAnimal)


class TipoAnimalAdmin(admin.ModelAdmin):
    list_display = ['descricao']
    search_fields = ['descricao']


class RacaAdmin(admin.ModelAdmin):
    list_display = ['descricao', 'tipo_animal']
    search_fields = ['descricao']
    list_filter = ['tipo_animal']


class ComandoAdmin(admin.ModelAdmin):
    list_display = ['descricao']
    search_fields = ['descricao']


class OutrasCaracteristicaAdmin(admin.ModelAdmin):
    list_display = ['descricao']
    search_fields = ['descricao']


class AnimalAdmin(admin.ModelAdmin):
    list_display = ['nome', 'adotado', 'raca',
                    'idade', 'sexo', 'peso', 'cor', 'cor_olho']
    search_fields = ['nome', 'raca__descricao']
    list_filter = ['adotado', 'raca', 'idade', 'sexo']
    
    def get_queryset(self, request):
        qs = super(AnimalAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(adotado=False)
    
    def save_model(self, request, obj, form, change):
        if not change:
            obj.user = request.user
        obj.save()
        
    


class FotoAnimalAdmin(admin.ModelAdmin):
    list_display = ['animal']
    search_fields = ['animal__nome']


class AnimalResgateAdmin(admin.ModelAdmin):
    list_display = ['data_resgate', 'local', 'animal', 'descricao']
    search_fields = ['animal__nome', 'descricao']
    list_filter = ['local']


class AdocaoAdmin(admin.ModelAdmin):
    list_display = ['data_adocao', 'data_inicio',
                    'animal', 'adotante', 'etapa']
    search_fields = ['animal__nome', 'adotante__username']
    list_filter = ['etapa']


admin.site.register(TipoAnimal, TipoAnimalAdmin)
admin.site.register(Raca, RacaAdmin)
admin.site.register(Comando, ComandoAdmin)
admin.site.register(OutrasCaracteristica, OutrasCaracteristicaAdmin)
admin.site.register(Animal, AnimalAdmin)
admin.site.register(FotoAnimal, FotoAnimalAdmin)
admin.site.register(AnimalResgate, AnimalResgateAdmin)
admin.site.register(Adocao, AdocaoAdmin)
