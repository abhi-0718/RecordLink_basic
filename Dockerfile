FROM python:3.8.10
WORKDIR /app

#COPYING all file from local machine to Docker Image 
COPY . /app

#UPGRADING pip
RUN pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org --upgrade pip
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

#Installing all the dependencies from req.txt
RUN pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org -r req.txt

#This component listen on port 8000
# EXPOSE 8000

CMD [ "python", "app.py" ]