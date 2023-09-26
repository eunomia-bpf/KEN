const { app, BrowserWindow, screen, webFrame, Menu, Tray } = require('electron');
const path = require('path');
const Store = require('electron-store');
const store = new Store();
const prompt = require('electron-prompt');
const defaultUrl = 'http://0.0.0.0:8000';
// const defaultUrl = 'https://chat.openai.com/chat/';

/* ============= DEV ============= */
/* Hot reload on code change ? * /
if (process.env.NODE_ENV !== 'production') {
  require('electron-reload')(__dirname, {
    electron: require(`${__dirname}/node_modules/electron`)
  });
}
/* ============= /DEV ============= */

let tray = null;
let mainWindow = null;
let appIsQuitting = false;

function createMainWindow () {

  const { width, height } = screen.getPrimaryDisplay().workAreaSize;

  let appConfigLoadUrl = store.get('app_loadUrl') ?? defaultUrl;
  const appConfigWindowBounds = store.get('app_windowBounds');
  const appConfigAlwaysOnTop = store.get('app_alwaysOnTop') ?? false;

  mainWindow = new BrowserWindow({
    minWidth: 420,
    minHeight: 500,
    width: appConfigWindowBounds?.width ?? Math.round(width * 0.25),
    height: appConfigWindowBounds?.height ?? height,
    x: appConfigWindowBounds?.x ?? Math.round(width * 0.75),
    y: appConfigWindowBounds?.y ?? 0,
    frame: false,
    alwaysOnTop: appConfigAlwaysOnTop,
    resizable: false,
    movable: false, // Window dragging
    webPreferences: {
      nodeIntegration: true, // Enable Node.js integration in the renderer process
      contextIsolation: false, // Enable Node.js integration in the renderer process
    }
  })

  mainWindow.loadURL(appConfigLoadUrl);

  mainWindow.on('closed', () => {
    mainWindow = null;
  })

  mainWindow.on('minimize', (event) => {
    event.preventDefault();
    mainWindow.hide();
  })

  app.on('before-quit', () => {
    appIsQuitting = true;
  });
  app.on('window-all-closed', () => {
    if (!appIsQuitting) {
      app.quit();
    }
  });
  app.on('quit', () => {
    if (!appIsQuitting) {
      app.relaunch();
      app.exit(0);
    }
  });
  mainWindow.on('close', (event) => {
    store.set('app_windowBounds', mainWindow.getBounds());
    if (!appIsQuitting) {
      event.preventDefault();
      mainWindow.hide();
    }
    return false;
  });

  /* TRAY */
  tray = new Tray(path.join(__dirname, 'KEN.png'));

  tray.on('click', () => {
    mainWindow.isVisible() ? mainWindow.hide() : mainWindow.show();
  })
  const zoomMenu = Menu.buildFromTemplate([
    { label: 'Zoom In', accelerator: 'CmdOrCtrl+Plus', click: function() { webFrame.setZoomLevel(webFrame.getZoomLevel() + 1); } },
    { label: 'Zoom Out', accelerator: 'CmdOrCtrl+-', click: function() { webFrame.setZoomLevel(webFrame.getZoomLevel() - 1); } },
    { label: 'Reset Zoom', accelerator: 'CmdOrCtrl+0', click: function() { webFrame.setZoomLevel(0); } }
  ]);

  const contextMenu = Menu.buildFromTemplate([
    { label: 'Zoom', submenu: zoomMenu },
    {
      label: 'Always on top',
      type: 'checkbox',
      checked: appConfigAlwaysOnTop,
      click: function() {
        let aotValue = !mainWindow.isAlwaysOnTop();
        mainWindow.setAlwaysOnTop(aotValue);
        store.set('app_alwaysOnTop', aotValue);
      }
    },
    {
      label: 'Change URL',
      click: () => {
        prompt({
          title: 'Enter a new URL',
          label: 'URL: This would be opened in the app',
          value: appConfigLoadUrl,
          width: 480,
          height: 180,
          inputAttrs: {
            type: 'url',
          },
        })
            .then( (result) => {
              let newUrl = (result && result.trim() !== '')?result:defaultUrl;
              appConfigLoadUrl = newUrl;
              store.set('app_loadUrl', newUrl);
              mainWindow.loadURL(newUrl);
            })
            .catch((err) => {
              console.error(err);
            });
      },
    },
    { label: 'Restart', click: () => { restartApp() } },
    { label: 'Quit', click: () => { appIsQuitting = true; app.quit() } },
  ])
  tray.setContextMenu(contextMenu);

}

app.on('ready', createMainWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  if (mainWindow === null) {
    createMainWindow();
  }
})

function restartApp() {
  app.relaunch();
  app.quit();
}

