# hw-vuln-check.sh
# Auditált CPU sebezhetőségi diagnosztikai script Linux kernel-alapú rendszerekhez
# Ez a script kizárólag olvasási műveletet végez — nem módosít, nem injektál, nem aktivál
# Használata kizárólag szakértői auditált környezetben javasolt

#!/bin/bash

echo "hw-vuln-check: auditált CPU sebezhetőségi diagnosztika"
echo "Csak olvasási művelet — nem módosít semmit"

VULN_DIR="/sys/devices/system/cpu/vulnerabilities"
OUTPUT="values"

if [ ! -d "$VULN_DIR" ]; then
  echo "Hiba: A sebezhetőségi könyvtár nem található ezen a rendszeren."
  exit 1
fi

echo "Eredmények mentése: $OUTPUT"
> "$OUTPUT"

for vuln in "$VULN_DIR"/*; do
  vuln_name=$(basename "$vuln")
  echo -n "$vuln_name: " >> "$OUTPUT"
  if [ -r "$vuln" ]; then
    cat "$vuln" >> "$OUTPUT"
  else
    echo "Nem olvasható" >> "$OUTPUT"
  fi
done

echo "Diagnosztika kész. Értékeld ki a '$OUTPUT' fájlt szakértőként."
