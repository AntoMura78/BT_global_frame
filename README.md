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

## Pubblicazione protetta con Microsoft Azure

Il file `staticwebapp.config.json` protegge l'intera applicazione, compresi i file nella cartella `data`, e richiede un account Microsoft associato al ruolo `cliente`.

Procedura:

1. Rendere privato il repository GitHub e disattivare GitHub Pages.
2. Nel portale Azure creare una nuova risorsa **Static Web App** con piano **Free**.
3. Collegare il repository GitHub `AntoMura78/BT_global_frame`, branch `main`.
4. Impostare **App location** su `/` e lasciare vuota **Output location**.
5. Attendere la prima distribuzione.
6. Nella risorsa Azure aprire **Role management** e invitare ogni cliente assegnando il ruolo `cliente` tramite provider Microsoft Entra ID.

Finché un utente non riceve il ruolo `cliente`, non può aprire né la dashboard né gli indirizzi diretti dei file CSV.
