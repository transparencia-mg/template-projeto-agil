README TEMPLATE PROJETO ÁGIL
===

O objetivo deste repositório é...

## Setup :open_book:

O setup windows poderá ser realizado via:

```Python
$ git clone <URL-PROJETO>
$ cd <NOME-PROJETO>  
$ python -m venv venv
$ source venv/Scripts/activate
$ pip install -r requirements.txt
```

O setup linux poderá ser realizado via:

```Python
$ git clone <URL-PROJETO>
$ cd <NOME-PROJETO>  
$ make setup
$ source venv/bin/activate
```

Obs.: Usuários linux poderão utilizar comandos `make`, consulte as opções disponíveis em via comando `make help`.
Check automated tasks with `make` or `make help` comands.

Comando `mkdocs serve` cria servidor local para visualização, em tempo real, das modificações realizadas no documento.

## Publicações de novas versões do documento

Versionamento desta documentação foi criada utilizando a biblioteca [mike](https://github.com/jimporter/mike), conforme orientações [material mkdocs](https://squidfunk.github.io/mkdocs-material/setup/setting-up-versioning/?h=version#versioning). 
[Exemplo de implementação](https://squidfunk.github.io/mkdocs-material-example-versioning/0.3/) e o [repositório de origem](https://github.com/squidfunk/mkdocs-material-example-versioning) também podem ser utilizados como referência.
Make target `gh-deploy-mike`, em conjunto com Github Actions, foi criado para facilitar o processo inicial de deploy da documentação (versão `0.1`).
Publicação da novas versões deverá ser realizada manualmente conforme orientado abaixo. 
Necessário atualizar versão do Make target `gh-deploy-mike` para que processo de deploy automático seja realizado corretamente.

```
$ git checkout gh-pages
$ git pull origin gh-pages
$ mike deploy --push --update-aliases <minor>.<major> latest
```

Visualização local da documentação versionada poderá ser feita via comando `mike serve`. Comando `mike set-default --push latest` configura a última versão como a default.

## Contribuições

Encontrou algo errado ou gostaria de enviar alguma sugestão. 
Abra um [Issue]() para nós.