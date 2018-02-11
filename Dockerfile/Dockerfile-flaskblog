FROM centos
MAINTAINER someone <someone@somedomain>
RUN yum -y install python wget git ; sleep 1
RUN wget https://bootstrap.pypa.io/get-pip.py ; sleep 1
RUN python get-pip.py ; sleep 1
RUN pip install flask ; sleep 1
RUN git clone https://github.com/naimabdrahman/flask-blog ; sleep 1
ENV FLASK_APP=/flask-blog/flaskr.py
RUN flask initdb
EXPOSE 80
CMD ["run", "--host=0.0.0.0", "--port=80"]
ENTRYPOINT ["flask"]
