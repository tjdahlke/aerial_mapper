docker build -t="aerial_mapper:latest" .;
docker run -w /working -v $1:/working -it aerial_mapper:latest;
# docker run --gpus all -w /working -v $1:/working -it aerial_mapper:latest;