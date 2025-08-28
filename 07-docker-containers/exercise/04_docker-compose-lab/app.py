import redis

r = redis.Redis(host="redis", port=6379)
print("Redis ping:", r.ping())
