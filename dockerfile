# use a node base image
FROM node:7-onbuild

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://40.87.8.37:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
