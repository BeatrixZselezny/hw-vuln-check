# hw-vuln-check

Auditált CPU sebezhetőség-lekérdező és mitigációs sablon Linux kernel-alapú rendszerekhez, kizárólag szakértőknek

🔒 Nem kereskedelmi célra  
🧠 Csak szakértőknek  
📎 Diagnosztikai célra, nem módosít


---

## 🔧 Platformkövetelmény

Ez az eszköz kizárólag Linux rendszereken működik, ahol a kernel támogatja a `/sys/devices/system/cpu/vulnerabilities/` könyvtárat.  
Windows, macOS vagy egyéb operációs rendszereklel nem kompatibilis — Ellenben Windows rendszereken alkalmazott virtuális gépeken futtatott Linux disztribúciókon 
tökéletesen használható /Vmware, WSL2/.

---

## 🎯 Cél

Ez a script kizárólag diagnosztikai célra készült.  
Nem módosítja a rendszer működését, nem injektál kernel paramétert, nem aktivál vagy deaktivál mitigációt.  
A cél: információt adni, hogy a felhasználó felelős döntést hozhasson a saját környezetére vonatkozóan.

---

## 🛠️ Használat

1. Töltsd le a `hw-vuln-check.sh` scriptet  
2. Futtasd audit joggal: `sudo bash hw-vuln-check.sh`  
3. A script létrehoz egy `values` nevű fájlt, amely soronként tartalmazza a CPU sebezhetőségek állapotát  
4. Értékeld ki a fájlt  
5. Ne alkalmazz semmilyen kernel paramétert, amíg nem auditáltad a saját hardver környezetedet

⚠️ A script nem módosít semmit — kizárólag olvas, és diagnosztikai céllal futtatható.

---

## 🧬 Környezeti injekció (haladó szint)

A script nem injektál semmit — de a kiértékelt `values` fájl alapján dönthetsz arról, hogy milyen mitigációs paramétereket alkalmazol a GRUB-on keresztül.

Ez kizárólag szakértői döntés lehet — pl. `spectre_v2=on`, `nosmt`, `tsx=off`, `mitigations=auto,nosmt`, stb.

⚠️ A környezeti injekció nem része a scriptnek — de a script segít eldönteni, hogy szükséges-e.

---


🔍 Minden sor egy adott sebezhetőség állapotát jelzi.  
A `Vulnerable` sorok kritikusak - enyhítés, korlátozás nélkül potenciálisan exploitálható, támadható.
Más értékek tekintetében a kernel.org ezzel foglalkozó tájékoztatása a szakmai irányadó.

---

## 🔒 Felelősségi nyilatkozat

A script futtatása kizárólag saját felelősségre történik.  
A szerző nem vállal felelősséget semmilyen kárért, amely a script  nem szakértői alkalmazásából ered.

---

## 🚫 Kereskedelmi kizárás

Ez az eszköz semmilyen formában nem hozható kereskedelmi forgalomba.  
Nem használható profitorientált célra, nem integrálható fizetős szolgáltatásba, nem értékesíthető.

A megosztás célja: technikai immunizálás, nem üzleti haszon.

---

## 🛡️ Záró nyilatkozat

Ha csak egyetlen gépet megment attól, hogy szemétteleppé váljon — már megérte ezzel foglalkoznom.

---

## 📜 Licenc

Ez a projekt nem hozható kereskedelmi forgalomba.  
A `LICENSE.audit.md` fájl tartalmazza a részletes felhasználási feltételeket.

Ez az eszköz kizárólag tanításra, diagnosztikára és auditált megosztásra szolgál.  
Nem használható profitorientált célra, nem integrálható fizetős szolgáltatásba, nem értékesíthető.

A megosztás célja: technikai immunizálás, nem üzleti haszon.



## 📄 Példa kimenet (`values` fájl)

