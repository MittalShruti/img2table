# Use a python image from AWS
FROM public.ecr.aws/lambda/python:3.10

# Copy the rest of your code into the right directory for the lambda function
COPY . ${LAMBDA_TASK_ROOT}

# Install the specified packages (and cache the downloaded packages)
RUN --mount=type=cache,target=/root/.cache/pip pip install .

# Copy function code
COPY lambda_function.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.lambda_handler" ]
