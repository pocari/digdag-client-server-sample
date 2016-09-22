# digdag server mode sample

## requirement

- docker
- docker-compose


## setup

### create data container


```
(cd data_container && docker build -t digdag_data_container . && docker run --name digdag_data_container digdag_data_container)
```


### build digdag container

```
bin/run.bash build
```

## start digdag server

```
bin/run up

or

bin/run up -d
```

