## MVP do Projeto Coruja

Mínimo Produto Viável (MVP) de uma aplicação Web para gerenciamento de cargos e permissões em uma organização composta por órgãos, instituições, análises de risco e ativos. Além de possibilitar a realização de avaliações de ameaças e ações adversas, assim como a atribuição de notas por especialistas independentemente.

## **Deploy**

Este projeto contém Flask como aplicação web configurado com o servidor uWSGI, NGinx como proxy reverso, e Alembic para migrações no banco MySQL, sendo tudo gerenciado pelo Docker Compose. Siga as seguintes instruções para executar o projeto:

1. Clone este repositório;
2. Modifique o arquivo `.env` adicionando uma senha e nome do banco de dados de sua escolha;
3. Modifique o arquivo `.secrets.toml` adicionando uma chave secreta para a aplicação;
4. Crie o certificado SSL (work in progress, solução definitiva em breve):
    ```
    openssl req -newkey rsa:4096 -sha256 -nodes -x509 \
        -subj "/C=BR/ST=AL/L=Maceió/O=LED\ UFAL/CN=nes-ssp-al.led-ufal.xyz" \
        -days 365 -keyout server.key -out server.crt
    ```
5. Execute `docker-compose up -d`.
6. Inicialize a base de dados e crie o super usuário com o comando `docker exec -it coruja-application make init`
7. Acesse `https://localhost`.

## :rotating_light: **Licença**

Este MVP está distribuído sobre a licença Apache 2.0. Para saber mais, acesse [LICENSE](/LICENSE).
