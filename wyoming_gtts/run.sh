#!/usr/bin/with-contenv bashio

# Read settings from the Home Assistant GUI
VOICE=$(bashio::config 'voice')
PORT=$(bashio::config 'port')
DATA_DIR=$(bashio::config 'data_dir')

bashio::log.info "Starting Wyoming gTTS..."
bashio::log.info "Configured Voice: ${VOICE}"
bashio::log.info "Configured Port: ${PORT}"
bashio::log.info "Data Directory: ${DATA_DIR}"

# Ensure data directory exists
if [ ! -d "${DATA_DIR}" ]; then
    bashio::log.warning "Data directory ${DATA_DIR} does not exist. Creating it."
    mkdir -p "${DATA_DIR}"
fi

# Run the Wyoming service
exec python3 -m wyoming_gtts \
    --voice "${VOICE}" \
    --data-dir "${DATA_DIR}" \
    --uri "tcp://0.0.0.0:${PORT}"
