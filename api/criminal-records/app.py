from flask import Flask, jsonify, request, render_template

app = Flask(__name__)

@app.route('/search', methods=['GET'])
def search():
    full_name = request.args.get('full-name')
    response = {'full-name': full_name,'status':'wip'}
    return jsonify(response)

@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == 'GET':
        return render_template('admin.html')
    elif request.method == 'POST':
        pin_id = request.form['pin-id']
        pin_key = request.form['pin-key']
        if pin_id == 'RICVR-23-T' and pin_key == 'T2Y433wrg3ad':
            return 'Access granted'
        else:
            return 'Access denied'

if __name__ == '__main__':
    app.run()
