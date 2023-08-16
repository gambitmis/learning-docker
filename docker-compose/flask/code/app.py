from flask import Flask,render_template

app = Flask(__name__)

@app.route('/')
def hello():
    return render_template("index.html")

if __name__ == '__main__':
	app.run(debug=True, port=8077, host='0.0.0.0')

#https://www.youtube.com/watch?v=VjIYcJVZCP0
