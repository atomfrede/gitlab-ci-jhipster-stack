# gitlab-ci-jhipster-stack

This image contains all dependencies to run build for jhipster applications on
gitlab ci. It requires the use of the provided wrappers for gradle and maven.

## Maven example

In order to have local maven repository cached by gitlab ci you have to change
the local maven repository when executing maven:

```
./mvnw package -Dmaven.repo.local=cache
```
In order to cache e.g. ``bower_components`` you can define this in your ``gitlab-ci.yml``.
A sample gitlab ci config may look like this:

```yml
image: atomfrede/gitlab-ci-jhipster-stack

cache:
  paths:
   - node_modules
   - src/main/webapp/bower_components
   - cache

stages:
  - build

mvn-package:
  stage: build
  script: "./mvnw package -Dmaven.repo.local=cache"
```

## Gradle example

For gradle you have to change the gradle cache directory. The downloaded gradle wrapper is also cached in this case.

```yml
image: atomfrede/gitlab-ci-jhipster-stack

cache:
  paths:
   - node_modules
   - src/main/webapp/bower_components
   - cache

stages:
  - build

gradle-assemble:
  stage: build
  script: "./gradlew -g cache assemble"
```
