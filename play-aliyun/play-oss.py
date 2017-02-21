# -*- coding: utf-8 -*-

import oss2
import time
from datetime import *
import shutil
import uuid

aliyun_access_key_id='<>'
aliyun_access_key_secret='<>'
oss_bucket_name = '<>'
oss_bucket_endpoint = '<>'

oss_key_dir='<>'
oss_key_filename='<>'


oss_auth = oss2.Auth(aliyun_access_key_id, aliyun_access_key_secret)
oss_bucket = oss2.Bucket(oss_auth, oss_bucket_endpoint, oss_bucket_name)
oss_key=oss_key_dir+oss_key_filename

def time_str():
    d = datetime.now()
    return d.strftime( '%Y-%m-%d %H:%M:%S')

def unique_id():
    return str(uuid.uuid1()).replace('-', '')

def put_object(filename, key):
    oss_bucket.put_object_from_file(key, filename)
    oss_bucket.put_object_acl(key, oss2.OBJECT_ACL_PUBLIC_READ)

def get_object(key, filename):
    remote_stream = oss_bucket.get_object(key)
    file=open(filename, "w")
    shutil.copyfileobj(remote_stream, file)
    file.close()

def list_objects(key):
    if key != '':
        key = key.rstrip('/') + '/'
    objects = []
    for record in oss_bucket.list_objects(key, delimiter='/').object_list:
        if record.key.endswith('/'):
            objects.append('dir - ' + record.key)
        else:
            objects.append('file - ' + record.key)
    return objects


def listdir(key):
    key = key
    if key != '':
        key = key.rstrip('/') + '/'
    key_list = []
    dir_list = []
    for i, key_info in enumerate(oss2.iterators.ObjectIterator(oss_bucket, prefix=key, delimiter='/')):
        if key_info.is_prefix():
            dir_list.append(key_info.key)
        else:
            key_list.append(key_info)
    contents = []
    for entry in key_list:
        to_add = entry.key.decode('utf-8')[len(key):]
        last_modified = entry.last_modified
        last_modified_str = datetime.utcfromtimestamp(last_modified).strftime('%Y/%m/%d %H:%M:%S')
        contents.append((to_add, entry.size, last_modified_str.decode('utf-8')))
    for entry in dir_list:
        to_add = entry.decode('utf-8')[len(key):]
        contents.append((to_add, -1, 0))
    return contents

def listbucket(bucket):
    for object_info in oss2.ObjectIterator(bucket):
        print(object_info.key)

def randome_write(filename):
    file=open(filename, "w+")
    file.write(unique_id())
    file.write(time_str())
    file.close()

upload_file="./upload.txt"
download_file="./download.txt"
oss_file_key=oss_key

randome_write(upload_file)
put_object(upload_file, oss_file_key)
get_object(oss_file_key, download_file)

print list_objects(oss_key_dir)
print listdir(oss_key_dir)
#listbucket(oss_bucket)





