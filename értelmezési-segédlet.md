# Értelmezési segédlet a `values` fájlhoz

Ez a fájl a `hw-vuln-check.sh` script kimenetének értelmezését segíti.  
A `values` fájl soronként tartalmazza az egyes CPU sebezhetőségek állapotát.

| Állapot | Jelentés | Teendő |
|--------|----------|--------|
| `Not affected` | A CPU nem érintett az adott sebezhetőségben | Nincs szükség beavatkozásra |
| `Mitigation: ...` | A kernel vagy hypervisor már alkalmaz védelmet | Érdemes ellenőrizni, hogy elegendő-e |
| `Vulnerable: ...` | A rendszer sebezhető, nincs megfelelő microcode vagy SMT állapot ismeretlen | Sürgős audit javasolt, csak szakértői döntéssel |
| `Unknown: ...` | A rendszer nem tudja megállapítani az állapotot (pl. virtualizáció miatt) | Hypervisor audit szükséges |

⚠️ A `Vulnerable` és `Unknown` sorok különösen figyelmet igényelnek.  
A script nem ad tanácsot — csak kijelöli, mit kell auditálni.
