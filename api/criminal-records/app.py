from flask import Flask, jsonify, request, render_template, session
import sqlite3
import requests
from bs4 import BeautifulSoup
from datetime import datetime
app = Flask(__name__)
app.secret_key = 'secret-key'

def connect_db():
    conn = sqlite3.connect("searches.db")
    c = conn.cursor()
    c.execute("""CREATE TABLE IF NOT EXISTS searches
                 (id INTEGER PRIMARY KEY, full_name TEXT, timestamp TEXT)
              """)
    conn.commit()
    return conn, c

def connect_screening_db():
    conn = sqlite3.connect("screening.db")
    c = conn.cursor()
    c.execute("""CREATE TABLE IF NOT EXISTS ro_wanted_persons (ID INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, DOB TEXT, extracted_date TIMESTAMP)
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
    if 'logged_in' in session:
        print("logged in already")
        conn, c = connect_db()
        c.execute("""SELECT * FROM searches""")
        searches = c.fetchall()
        print(searches)
        conn.close()

        conn, c = connect_screening_db()
        c.execute(""" SELECT * FROM ro_wanted_persons WHERE extracted_date = (SELECT MAX(extracted_date) FROM ro_wanted_persons)""")
        scr = c.fetchall()
        conn.close()
        return render_template('admin.html', searches=searches,scr = scr)
    if request.method == 'GET':
        return render_template('admin_login.html')
    elif request.method == 'POST':
        pin_id = request.form['pin_id']
        pin_key = request.form['pin_key']
        if pin_id == 'RICVR-23-T' and pin_key == 'T2Y433wrg3ad':
            session['logged_in'] = True
            return render_template('admin.html')
        else:
            return 'Access denied'
@app.route('/update_records', methods=['GET'])
def update_records():
    url = "https://www.politiaromana.ro/ro/persoane-urmarite"
    response = requests.get(url,verify=False)
    soup = BeautifulSoup(response.content, "html.parser")

    names = soup.find_all("h3", class_="descNume")
    names_list = []
    for name in names:
        print(name.text)
        names_list.append(name.text)

    dates_of_birth = soup.find_all("span", class_="descData")
    dob_list = []
    for dob in dates_of_birth:
        print(dob.text)
        dob_list.append(dob.text)

    conn = sqlite3.connect("screening.db")
    c = conn.cursor()

    c.execute("DROP TABLE IF EXISTS ro_wanted_persons")
    c.execute(
        "CREATE TABLE IF NOT EXISTS ro_wanted_persons (ID INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, DOB TEXT, extracted_date TIMESTAMP)")
    now = datetime.now()
    for i in range(len(names_list)):
        c.execute("INSERT INTO ro_wanted_persons (Name, DOB, extracted_date) VALUES (?, ?, ?)",
                  (names_list[i], dob_list[i], now))
    conn.commit()
    conn.close()
    return "Records updated"

if __name__ == '__main__':
    app.run()
