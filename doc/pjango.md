# pjango


# Python Django Web Framework

## install python & pjango

```
sudo apt-get install python-pip python-dev virtualenv -y
sudo pip install Django

```

### check 

``` python
import django
django.get_version()
```

### django admin tool 

安装完Django之后，就已经有了可用的管理工具django-admin.py。我们可以使用django来创建project，app等。

django-admin.py startproject <project-name>
django-admin.py startapp <app-name>



## create play-django

```
mkdir -p play-django/{projects,apps}

cd play-django/projects
django-admin.py startproject hello

cd ../apps
django-admin.py startapp echo

```

## Django projects v.s apps

  Django中project和APP的区别: project包含全局配置，构成一个全局的运行平台；而各个APP都运行在这个全局的运行平台上，APP代表的是一个相对独立的功能模块，因为程序的逻辑都在APP中。

## Python manage.py syncdb

Python manage.py syncdb 会为该project内的所有app进行数据库初始化，创建表结构，初始化数据，创建索引等。若有app改变了数据库结构，或者是有新的app增加进来，要创建新的表结构，再次运行syncdb，会为这些app进行数据库变更。django怎么识别哪个app是关联了数据库的？要知道自定义的model都是继承自django.db.models.Model这个类的。

当需要命令行操作数据库时，切换数据库账号为开发者账号，支持数据库表结构变更



## references

[django models例子](http://www.ziqiangxuetang.com/django/django-models.html)