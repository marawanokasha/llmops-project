FROM python:3.13-slim


COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -qr requirements.txt && rm requirements.txt

COPY --chown=$SET_UID:$SET_GID ./src $SET_HOME_DIR/
COPY ./config $SET_HOME_DIR/config
