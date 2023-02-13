# Git Practices

this is what we do when we introduce new code into the repo. 

## On first clone

- You fork, then clone your fork.
- you create branches off main in your fork
- you work on the branch, push to your fork and then pull request in

## Git commit messages
Messages should conform to the [conventional commit standards](https://www.conventionalcommits.org/en/v1.0.0-beta.2/#specification), it should look
something like this

```
type(scope): message

more detail
```
where type is either
- feat
- fix
- chore
- doc
- test

where scope is the feature your working on
for example `title` it should probably just be the name of the module

where message is the change in detail
