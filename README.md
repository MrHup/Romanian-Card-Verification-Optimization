
# 🔥 Welcome to MorpheusID's *addon bundle*!
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

- `frontend`: a simple Flutter desktop/web app that leverages the MorpheusID plugin to capture user data;
- `api`: a set of modules used for detecting user activity on the internet and assigning them a reliability score, which denotes the probability of that user being real based on online avaialble criminal records.

## ⚙️ Getting Started
### Web Interface
Clone this repository and navigate to the web-interface directory:

    cd Romanian-Card-Verification-Optimization/frontend

Install the dependencies. For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

    flutter run

Choose appropriate environment based on local running device.

Open your browser to http://localhost:3000 to see the web app in action!

### API

Clone this repository and navigate to the api directory:

    cd MorpheusID/api/criminal-records

Install the dependencies:

    pip install -r requirements.txt

Run the Flask development server:

    flask run

The API will be available at http://localhost:5000. You can use a tool like Postman to send requests to the API and see the results.

## 💡 Still a WIP

Thanks for checking out MorpheusID! 🙏