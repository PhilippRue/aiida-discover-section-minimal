
# aiida database visualizer

Starts an `bokeh server` which has a connection to aiida.
The test page is shown at `http://localhost:5006/test-app`

## Manual installation

### Installation

```
git clone https://github.com/PhilippRue/aiida-discover-section-minimal.git
cd aiida-discover-section-minimal
pip install -e test-app   # install python dependencies
```

### prepare the test data

```
verdi import data/KkrCalculation-nodes-53acc7b8a54857077284f1114ca72811.tar.gz
```

### Running the app

```
./serve-app.sh
```


## Running the app in a docker container

In the `aiida-discover-section-minimal` directory run
```
docker-compose build
docker-compose up
```

This will do the full installation including preparing the test data in the database.
