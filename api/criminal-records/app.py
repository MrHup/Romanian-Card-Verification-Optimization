from flask import Flask, jsonify, request, render_template
import sqlite3
app = Flask(__name__)

def connect_db():
    conn = sqlite3.connect("searches.db")
    c = conn.cursor()
    c.execute("""CREATE TABLE IF NOT EXISTS searches
                 (id INTEGER PRIMARY KEY, full_name TEXT, timestamp TEXT)
              """)
    conn.commit()
    return conn, c


@app.route('/search', methods=['GET'])
def search():
    full_name = request.args.get('full-name')
    response = {'full-name': full_name,'status':'wip'}
    conn, c = connect_db()
    c.execute("""INSERT INTO searches (full_name, timestamp) 
                 VALUES (?, datetime('now'))
              """, (full_name,))
    conn.commit()
    conn.close()
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
