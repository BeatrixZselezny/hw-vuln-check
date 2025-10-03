# hw-vuln-check

Auditált CPU sebezhetőség-lekérdező és mitigációs sablon Linux kernel-alapú rendszerekhez, kizárólag szakértőknek

![Audit-ready](https://img.shields.io/badge/audit-ready-green)
![No-microcode](https://img.shields.io/badge/microcode-optout-blue)
![Spectre-aware](https://img.shields.io/badge/spectre-v2-on-orange)
![Not-for-commercial-use](https://img.shields.io/badge/no-commercial-use-red)

---

## 🔧 Platformkövetelmény

Ez az eszköz kizárólag Linux rendszereken működik, ahol a kernel támogatja a `/sys/devices/system/cpu/vulnerabilities/` könyvtárat.  
Windows, macOS vagy egyéb operációs rendszerek nem kompatibilisek — ne próbáld futtatni rajtuk.

A script működése kernel-verzióhoz és build-opciókhoz kötött — csak auditált Linux környezetben alkalmazható.

---

## 🎯 Cél

Ez a script kizárólag diagnosztikai célra készült.  
Nem módosítja a rendszer működését, nem injektál kernel paramétert, nem aktivál vagy deaktivál mitigációt.  
A cél: információt adni, hogy a felhasználó felelős döntést hozhasson a saját környezetére vonatkozóan.

---

## 🛠️ Használat

1. Töltsd le a `hw-vuln-check.sh` scriptet  
2. Futtasd rootként vagy audit joggal: `sudo bash hw-vuln-check.sh`  
3. A script létrehoz egy `values` nevű fájlt, amely soronként tartalmazza a CPU sebezhetőségek állapotát  
4. Értékeld ki a fájlt — ne vakon, hanem szakértelemmel  
5. Ne alkalmazz semmilyen kernel paramétert, amíg nem validáltad a saját környezetedet

⚠️ A script nem módosít semmit — kizárólag olvas, és diagnosztikai céllal futtatható.

---

## 🧬 Környezeti injekció (haladó szint)

A script nem injektál semmit — de a kiértékelt `values` fájl alapján dönthetsz arról, hogy milyen mitigációs paramétereket alkalmazol a GRUB-on keresztül.

Ez kizárólag szakértői döntés lehet — pl. `spectre_v2=on`, `nosmt`, `tsx=off`, `mitigations=auto,nosmt`, stb.

⚠️ A környezeti injekció nem része a scriptnek — de a script segít eldönteni, hogy szükséges-e.

---


🔍 Minden sor egy adott sebezhetőség állapotát jelzi.  
A `Vulnerable` sorok különösen kritikusak — ha microcode hiányzik vagy SMT állapot ismeretlen, a rendszer potenciálisan támadható.

---

## 🔒 Felelősségi nyilatkozat

A script futtatása kizárólag saját felelősségre történik.  
A szerző nem vállal felelősséget semmilyen kárért, amely a script félreértett, felelőtlen vagy nem szakértői alkalmazásából ered.

Ez nem termék, nem szolgáltatás, nem árucikk — hanem auditált technikai tanítás.

---

## 🚫 Kereskedelmi kizárás

Ez az eszköz semmilyen formában nem hozható kereskedelmi forgalomba.  
Nem használható profitorientált célra, nem integrálható fizetős szolgáltatásba, nem értékesíthető.

A megosztás célja: technikai immunizálás, nem üzleti haszon.

---

## 🛡️ Záró nyilatkozat

Ha csak egyetlen gépet megment attól, hogy szemétteleppé váljon — már megérte.


## 📄 Példa kimenet (`values` fájl)

