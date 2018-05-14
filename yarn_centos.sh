#!/usr/bin/env bash
npm cache clear
yum install -y gcc
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
yum install -y yarn
yarn init -y
yarn global add node-gyp

