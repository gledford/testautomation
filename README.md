# testautomation
This project is a sample for performing test automation using robot framework

## Setup
Once the repo is cloned, run the following commands to verify installation:

````
docker image build -t testautomation:latest .

docker run -v <repo>/robot/results:/root/tests/results --rm testautomation:latest
````

If all of the tests pass, then the install was successful.
Verify that the results directory now contains data.
