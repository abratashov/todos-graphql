# README

### Setup application

```
bundle
rails db:create
rails db:migrate
rails s
```

### Install GraphQL UI client
[altair-graphql-client](https://addons.mozilla.org/en-US/firefox/addon/altair-graphql-client/)

### Query examples

##### Create user
Query:
```
mutation($email: String!, $password: String!, $passwordConfirmation: String!) {
  userCreate(input: {
    email: $email,
    password: $password,
    passwordConfirmation: $passwordConfirmation
  }) {
    user {
      id,
      email
    },
    errors {
      messages,
      path
    }
  }
}
```
Variables:
```
{
  "email": "test@test.test",
  "password": "password",
  "passwordConfirmation": "password"
}
```
##### Create session
Query:
```
mutation($email: String!, $password: String!) {
  sessionCreate(input: {
    email: $email,
    password: $password,
  }) {
    user {
      id,
      email
    },
    token
  }
}
```
Variables:
```
{
  "email": "test@test.test",
  "password": "password",
  "passwordConfirmation": "password"
}
```

##### Create project
Headers:
`Authorization = $token # from previous response`

Query:
```
mutation($title: String!) {
  projectCreate(input: {
    title: $title
  }) {
    project {
      id,
      title
      createdAt
      updatedAt
    },
    errors {
      messages,
      path
    }
  }
}
```
Variables:
```
{
  "title": "Project 1"
}
```
##### Create task
Query:
```
mutation($projectId: ID!, $name: String!) {
  createTask(input: {
    projectId: $projectId,
    name: $name
  }) {
    task {
      id
      name
      done
      projectId
      createdAt
      updatedAt
    },
    errors {
      messages,
      path
    }
  }
}
```
Variables:
```
{
  "projectId": 0,
  "name": "task 1"
}
```

##### Show personal information
Query:
```
query {
  me {
    id
    email
    projects {
      id
      title
      tasks {
        id
        name
        done
        comments {
          id
          body
          attachmentUrl
        }
      }
    }
  }
}
```
Variables:
```
{
  "email": "test@test.test",
  "password": "password",
  "passwordConfirmation": "password"
}
```

### Sources for exploring

[Trailblazer Framework](https://trailblazer.to/)

[Example Trailblazer app](https://github.com/trimentor/trb-rails-example)

[A Detailed Tutorial on How to Build an API App Based on GraphQL and Trailblazer: Part 1](https://rubygarage.org/blog/graphql-and-trailblazer-tutorial)

[A Detailed Tutorial on How to Build an API App Based on GraphQL and Trailblazer: Part 2](https://rubygarage.org/blog/graphql-and-trailblazer-tutorial-part-2)

[Source code](https://github.com/Svatok/graphql-tutorial)

[Another GraphQL example app](https://github.com/cncgl/graphql-rails-todo)


License
----

MIT
