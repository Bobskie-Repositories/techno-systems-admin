# Techno Systems

Merged systems:

- Class Management, Team Management, and Peer Evaluation
- Activity Management
- Spring board
- Teknoplat

# Development

Requirements:

- Docker
- Docker Compose
- node & npm
- python 3.11

Run `npm install` first in the `frontend` folder to install all the dependencies to avoid eslint errors.

To auto fix eslint errors open your VSCode User Settings JSON and add the following:

```json
"[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
},
"editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit"
},
"editor.formatOnSave": true,
"eslint.validate": [
    "json",
    "javascript",
    "javascriptreact",
    "html"
],
```

## Dev build for non docker backend django framework and frontend react

Comment out the backend and frontend services in the docker-compose.yml file.
We will only run the mysql and phpyadmin services.

Run the mysql and phpmyadmin services:

```
docker-compose up --build -d
```

#### Backend API

```
cd backend
```

Setup Python Virtual Environment

```
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

Uncomment this line under `backend/backend/wildforge/settings.py`

```
# load_dotenv(os.path.join(API_REPO_DIR, 'nondocker.env'))
```

In nondocker.env and backend.env, supply a working openai api key

Run the migrations and the backend server:

```
python3 backend/manage.py makemigrations && python3 backend/manage.py migrate && python3 backend/manage.py runserver
```

#### Frontend React

```
npm install
```

If you are running on windows, change the port from 80 -> 8000 in config.js
then run the frontend server:

```
npm start
```

## Dev Build with Docker

\*If you are running on windows, follow this:

```
cd backend
dos2unix entrypoint.sh
```

To build and run the system use command:

```
docker-compose up --build -d
```

If you are changing some files and are not being updated in a specific container, you can use the command to recreate the service:

```
docker-compose up -d --no-deps --build <service_name>
```

The database for techno-systems and techno-systems-admin are the same. The Techno-systems-admin can only be accessible to user with the role of 0.

There is techno_db(8).sql. Import that to your database for initial data on your local.

user: admin@gmail.com
pass: admin123

## Run demo

React App: http://127.0.0.1:3000/

Django API with swagger: http://127.0.0.1:8000/swagger/

# Cleaning the docker if you are running out of space

Must run this with git bash in windows or in linux terminal.

```
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -q)
```
