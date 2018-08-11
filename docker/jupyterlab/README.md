# Jupyter Lab docker image

Build:

```bash
bash dockerize.sh
```


Run:

```bash
docker run -it -d --rm \
    --name jupyterlab \
    --publish 8888:8888 \
    -v /path/to/local/notebook:/notebook \
    -v /home/myuser/.aws:/home/imjang57/.aws \
    imjang57/jupyterlab:latest
```
