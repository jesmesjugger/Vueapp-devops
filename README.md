# Vueapp-devop
![Codequality workflow](https://github.com/jesmesjugger/Vueapp-devops/actions/workflows/njsscan-analysis.yml/badge.svg)
## uses OpenWeather API to search and display weather from accross the globe
## This is a sample project for CICD pipeline for Vuejs app leveraging on AWS Cloud native tools

#### by Martin Mkolwe

## Project setup servers to use this userdata for installing necessary packages needed

```
#!/bin/bash
yum -y update
amazon-linux-extras install epel -y
yum -y install nginx git ruby
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
service codedeploy-agent start
service codedeploy-agent enable
systemctl start nginx
systemctk enable nginx
cd /usr/share/nginx/html
yum update -y
curl --silent --location https://rpm.nodesource.com/setup_12.x |  bash -
yum install -y nodejs-12.18.4-1nodesource
npm install -g @vue/cli@latest
```

### buidspec.yml to use the below contents

```
version: 0.2

#phases
phases:
  install:
    #If you use the Ubuntu standard image 2.0 or later, you must specify runtime-versions.
    #If you specify runtime-versions and use an image other than Ubuntu standard image 2.0, the build fails.
    runtime-versions:
       nodejs: 12
      # name: version
    commands:
       - echo initializing runtime environment on $(date)
      # - command
  pre_build:
    commands:
       - echo ready to start building artifacts
      # - command
  build:
    commands:
       - echo build started successfully on $(date)
       - npm install
  post_build:
    commands:
       - npm run build
       - echo packaging production ready artifacts

artifacts:
  files:
     - scripts/*
     - dist/**/*
     - appspec.yml
  name: devops-master-$(date +%Y-%m-%d)

```

### Ensure that your EC2 has a profile role for codedeploy and also create a role for codedeploy to assume


