FROM texlive/texlive:latest

# Instalar librsvg2-bin para la conversión automática de SVG a PDF vectorial
RUN apt-get update && \
    apt-get install -y --no-install-recommends librsvg2-bin && \
    rm -rf /var/lib/apt/lists/*
