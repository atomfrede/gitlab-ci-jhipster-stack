# gitlab-ci-jhipster-stack

This image contains all dependencies to run build for jhipster applications on
gitlab ci. It requires the use of the provided wrappers for gradle and maven.

## Maven example

In order to have local maven repository cached by gitlab ci you have to change
the local maven repository when executing maven:

```
./mvnw package -Dmaven.repo.local=$MAVEN_USER_HOME
```
In order to cache e.g. ``node_modules`` you can define this in your ``gitlab-ci.yml``.
A sample gitlab ci config may look like this:

```yml
image: atomfrede/gitlab-ci-jhipster-stack

cache:
  key: "$CI_BUILD_REF_NAME"
  paths:
    - node_modules
    - .maven

before_script:
    - export MAVEN_USER_HOME=`pwd`/.maven
    - npm install

stages:
  - build

mvn-package:
  stage: build
  script: "./mvnw package -Dmaven.repo.local=$MAVEN_USER_HOME"
```

A full example can be found on [gitlab](https://gitlab.com/atomfrede/jhipster-ci-example-maven).

## Gradle example

For gradle you have to change the gradle cache directory. When using the convention property ``GRADLE_USER_HOME`` you don't need to
specify the cache directory for every command. The downloaded gradle wrapper is also cached in this case.

```yml
image: atomfrede/gitlab-ci-jhipster-stack

cache:
  key: "$CI_BUILD_REF_NAME"
  paths:
    - node_modules
    - .gradle/wrapper
    - .gradle/caches

before_script:
    - export GRADLE_USER_HOME=`pwd`/.gradle
    - npm install

stages:
  - build

mvn-package:
  stage: build
  script: "./gradlew assemble"
```

A full example can be found on [gitlab](https://gitlab.com/atomfrede/jhipster-ci-example-gradle).
