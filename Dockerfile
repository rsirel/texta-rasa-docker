FROM continuumio/miniconda3:latest

# Copy environment file
COPY environment.yaml /var/environment.yaml

# Build Conda environment
RUN set -x \
    && conda env create -f /var/environment.yaml \
    && conda init bash \
    && conda clean -afy \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete

# copy project files
COPY ria-bot /var/texta-rasa/

# System configuration files
#COPY supervisord.conf /opt/conda/envs/texta-rasa/etc/supervisord/conf.d/supervisord.conf

#RUN mkdir /var/texta-rasa/

#RUN ls /var/texta-rasa

# copy & execution rights for entrypoint
COPY entrypoint.sh /var/texta-rasa/entrypoint.sh
RUN chmod +x /var/texta-rasa/entrypoint.sh

EXPOSE 5005

ENTRYPOINT ["/var/texta-rasa/entrypoint.sh"]
CMD ["--help"]
