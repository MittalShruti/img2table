# Use a python image from AWS
FROM public.ecr.aws/lambda/python:3.10

# Copy the rest of your code into the right directory for the lambda function
COPY requirements.txt ${LAMBDA_TASK_ROOT}

# Install the specified packages (and cache the downloaded packages)
RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt

# Copy function code
COPY lambda_function.py ${LAMBDA_TASK_ROOT}
COPY img2table ${LAMBDA_TASK_ROOT}/img2table

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.lambda_handler" ]
