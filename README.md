
# 🔥 Welcome to MorpheusID's *identity finder*!
## User Identity Verification using web pressence scoring
MorpheusID is a plugin that helps developers reduce the number of fake identities on their platforms by using ID card verification and real time gesture checks through a simple video. Check it out at [https://morpheus-identity.com/](https://morpheus-identity.com/).

<center>
<img src="https://morpheus-identity.com/static/media/logo.8f548da9ac1ae0d7966d.png" alt="MorpheusID logo" width="150">
</center>

## 🚀 Project scope

The aim of this project is to build ontop of the existing framework to develop new way of measuring identity trust score.

**MorpheusID scraper** uses online available resources to detect online presence and vouch or deny the access of a user to a given platform based on the results.


## 📂 Structure

This project is made up of two main components:

- `web-interface`: a simple React web app that leverages the MorpheusID plugin to capture user data
- `api`: a set of modules used for detecting user activity on the internet and assigning them a reliability score, which denotes the probability of that user being real

## ⚙️ Getting Started
### Web Interface
Clone this repository and navigate to the web-interface directory:

    cd Romanian-Card-Verification-Optimization/web-interface

Install the dependencies:

    npm install

Start the development server:

    npm start

Open your browser to http://localhost:3000 to see the web app in action!

### API

Clone this repository and navigate to the api directory:

    cd MorpheusID/api

Install the dependencies:

    pip install -r requirements.txt

Run the FastAPI development server:

    uvicorn main:app --reload

The API will be available at http://localhost:8000. You can use a tool like Postman to send requests to the API and see the results.

## 💡 Still a WIP

Thanks for checking out MorpheusID! 🙏