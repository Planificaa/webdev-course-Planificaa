lesson="$1"
file="$2"

if [ -z "$lesson" ] || [ -z "$file" ]; then
  echo "❌ Uso: ./run-local.sh <lesson-folder> <archivo.html>"
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/starter-files/$lesson/$file"

if [ ! -f "$TARGET" ]; then
  echo "❌ No existe $TARGET"
  exit 1
fi

echo "🌐 Abriendo $file desde $lesson ..."
# Detectar navegador disponible
if command -v xdg-open >/dev/null; then
  xdg-open "$TARGET"
elif command -v open >/dev/null; then
  open "$TARGET"
else
  echo "Copia y pega esta ruta en tu navegador:"
  echo "$TARGET"
fi