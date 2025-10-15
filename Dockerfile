FROM ghcr.io/saladtechnologies/comfyui-api:comfy0.3.62-api1.11.0-torch2.8.0-cuda12.8-h3d-21

ENV STARTUP_CHECK_MAX_TRIES=30

# Now we copy our model into the image
ENV MODEL_DIR=/opt/ComfyUI/models
ENV CHECKPOINT_DIR=${MODEL_DIR}/checkpoints
COPY flux1-schnell-fp8.safetensors ${CHECKPOINT_DIR}/

ADD https://github.com/SaladTechnologies/comfyui-api/releases/download/1.11.0/comfyui-api .
RUN chmod +x comfyui-api

# COPY workflow_api_flux_fp8.json .
# ENV WARMUP_PROMPT_FILE=workflow_api_flux_fp8.json

CMD ["./comfyui-api"]
