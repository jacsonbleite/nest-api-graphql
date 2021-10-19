# Siga os passos abaixo para instalar os pacotes e/ou dependências necessários(as) para utilizar a API

Ao entrar na pasta do projeto execute os comandos abaixo:

```bash
npm install
```

```bash
npm run start:dev
```

## Utilizando o playground do GraphQL para teste das rotas

<http://localhost:3000/graphql/>

### Criar post

```
mutation{
  createPost(input:{
    title:"Olá Mundo",
    content:"Conteúdo olá mundo"
  }){
    id
    title
    content
    published
    createdAt
  }
}
```

### Atualizar post

```
mutation{
  updatePost(input:{
    id:"2",
    published:true,
    title:"Olá Mundo agora é true"
  }){
    id
    title
    published
  }
}
```

### Deletar Post

```
mutation{
  deletePost(id:"2"){
    id
  }
}
```

### Mostar todos os Posts

```
query{
  posts{
    id
    title
    content
  }
}
```

### Mostar um Post

```
query{
  post(id:"3"){
    title
  }
}
```

<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>
