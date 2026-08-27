# Dashboard BTicino — Serie storiche

## Aggiornamento dei dati

Il database principale è `data/df_global.csv`.

### Pubblicazione su GitHub Pages

1. Sostituire `data/df_global.csv` con la nuova versione, mantenendo nome, separatore `;` e colonne `period` e `correction`.
2. Caricare il nuovo file nel repository GitHub.
3. Ricaricare la pagina pubblicata. La dashboard legge direttamente il CSV ed evita di usare una copia in cache.

### Uso locale con doppio clic

1. Sostituire `data/df_global.csv`.
2. Fare doppio clic su `aggiorna_dati.bat`.
3. Attendere il messaggio di conferma e premere un tasto per chiudere la finestra.
4. Aprire `index.html` o ricaricarlo con `Ctrl+F5`.

Il comando genera `data/df_global.js`, necessario perché i browser non consentono a una pagina aperta come file locale di leggere direttamente un CSV vicino.

## Pubblicazione iniziale su GitHub Pages

Caricare nel repository almeno:

- `index.html`
- la cartella `assets`
- la cartella `data`
- `aggiorna_dati.bat` e `aggiorna_dati.ps1` se si desidera mantenere anche l'uso locale

In GitHub aprire **Settings → Pages**, scegliere **Deploy from a branch**, selezionare il branch principale e la cartella `/ (root)`.
