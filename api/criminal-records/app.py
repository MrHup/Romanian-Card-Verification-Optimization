from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/search', methods=['GET'])
def search():
    full_name = request.args.get('full-name')
    response = {'full-name': full_name,'status':'wip'}
    return jsonify(response)

if __name__ == '__main__':
    app.run()
