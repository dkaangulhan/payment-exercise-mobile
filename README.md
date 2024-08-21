# Intro

This project is being developed to explore payment systems using iyzico APIs. The project is mobile side of full-stack project "full-stack-payment-exercise" [Project link](https://github.com/dkaangulhan/full-stack-payment-exercise)

## Initializing

The project uses environment variables. To provide required enviroment variables create a file named ".env" in the root of the project. The file should contain the following list of items:

- HOST: This field specifies the host address of the API we are connecting. If you are running the server locally the value will be like that: http://\<your-local-address\>

After you provide required fields, run `dart run build_runner build` from root of the project using terminal. This will also create generated files of the models that uses `JsonSerializable` annotation..
