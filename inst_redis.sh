docker run -d --name redis-stack-server -p 6379:6379 -e REDIS_ARGS="--requirepass redis-stack" redis/redis-stack-server:latest
