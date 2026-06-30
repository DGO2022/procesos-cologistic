#!/bin/bash
# Convierte los SVGs operativos a PNG y los copia a docs/entregable_3/imagenes/
# Uso: cd macro-operativos/svgs && bash exportar_a_imagenes.sh

DEST="../../docs/entregable_3/imagenes"
SVGS=(
  rec_p1_registro
  rec_p2_verificacion
  alm_p1_transferencia
  alm_p2_reempaque
  aco_p1_repaletizado
  aco_p2_reencajado
  des_p1_registro
  des_p2_verificacion
)

for name in "${SVGS[@]}"; do
  svg="${name}.svg"
  png="${DEST}/${name}.png"
  if [ ! -f "$svg" ]; then
    echo "FALTA: $svg — expórtalo primero desde bpmn.io"
    continue
  fi
  # rsvg-convert (brew install librsvg) — alternativa: inkscape o cairosvg
  if command -v rsvg-convert &>/dev/null; then
    rsvg-convert -w 2400 "$svg" -o "$png" && echo "✓ $png"
  elif command -v inkscape &>/dev/null; then
    inkscape "$svg" --export-type=png --export-width=2400 --export-filename="$png" && echo "✓ $png"
  elif command -v cairosvg &>/dev/null; then
    cairosvg "$svg" -o "$png" --output-width 2400 && echo "✓ $png"
  else
    echo "ERROR: instala rsvg-convert (brew install librsvg), inkscape o cairosvg"
    exit 1
  fi
done
echo "Listo."
