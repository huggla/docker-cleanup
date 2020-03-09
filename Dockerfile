# Secure and Minimal Docker cleanup image
# https://hub.docker.com/repository/docker/huggla/sam-cleanup

# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_VERSION="2.0.1"
ARG IMAGETYPE="application"
ARG RUNDEPS="bash docker grep"
ARG STARTUPEXECUTABLES="/usr/local/bin/run.sh"
ARG EXECUTABLES="/usr/local/bin/docker-cleanup-volumes.sh"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base}} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-build} as build
FROM ${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================
ENV VAR_CLEAN_PERIOD="**None**" \
    VAR_DELAY_TIME="**None**" \
    VAR_KEEP_IMAGES="**None**" \
    VAR_KEEP_CONTAINERS="**None**" \
    VAR_LOOP="true" \
    VAR_DEBUG="0" \
    VAR_DOCKER_API_VERSION="1.20" \
    VAR_FINAL_COMMAND="run.sh"

# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>
