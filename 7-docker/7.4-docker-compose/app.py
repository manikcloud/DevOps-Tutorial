import logging

# Add these lines at the beginning of your app.py file
logging.basicConfig(level=logging.DEBUG)

# Your existing code goes here
from flask import Flask, request
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route('/')

def hello():
    return 'Hello World! This is a simple voting application.'

@app.route('/vote', methods=['POST'])
def vote():
    option = request.form.get('option')
    redis.incr(option)
    return f"Voted for: {option}"

@app.route('/results')
def results():
    return {option.decode(): int(redis.get(option)) for option in redis.keys()}
