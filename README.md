
## Install nvm(optional, node version manager)
``` bash
# clone nvm from github
cd ~
git clone https://github.com/creationix/nvm.git

# add line below to your ~/.bashrc or(and) /etc/profile
source ~/nvm/nvm.sh
```


## Install node & npm
``` bash
# run cmd below to find node versions
nvm ls-remote

# run cmd below to install node(npm will be auto installed)
nvm install 6.11.2

# check version
node -v
npm -v

# config npm, write lines below to npm config file ~/.npmrc:
registry=https://registry.npm.taobao.org
cache=/opt/.caches/npm
```

## Prepare env
```bash
# install packages in project root
npm install
```

## Build
``` bash
# build with gulp cmd in project root
gulp

# build for release
gulp -r true
```

## Deploy
``` bash
# deploy files & folders in dist folder
cp -r dist dest_folder
```

## How to Start
* Open main page tag file: v1/tags/t-intro.tag in IDE
* Edit it
* Build for release
* When need add new page, add new tag file on folder: v1/tags/ and open file: v1/tags/t-main.tag
* Add case in t-main.tag file like this:
```case 'intro':```
```                    return loadTag('tags/t-intro.tag', function() {```
```                        setTag('t-intro')```
```                    })```
