## ChatGPT Desktop Companion

The [ChatGPT desktop companion app](https://github.com/thinkdj/ChatGPT-Desktop-Companion) is a convenient and easy-to-use tool that allows users to access ChatGPT parallelly while they work on their computer. With this app, ChatGPT will always be available at the user's fingertips, eliminating the need to switch between tabs or applications. The sidebar can be docked on the side of the desktop screen and can be resized to the user's preference.


```cmd
 npm i -g electron
 npm i
 npm start (or electron .)
```

#### Screenshot

![Screenshot](https://i.ibb.co/8M33CSn/Chat-GPT-Sidebar-Screenshot.png)

---------------------------

## Change Log

##### Version 1.0.2 (2023-02-24)
- "Change URL" option for future-proofing
##### Version 1.0.1 (2023-02-23)
- Remembers the last window size and state
- Support for Tray menu "Always on top", "Restart", "Quit"
##### Version 1.0.0 (2023-02-23)
 - Initial release
 - Resizable chromeless window
 - Minimize/Close to Tray

---------------------

This app is built on **Electron**. 
You can build the final binaries using electron-packager, electron-forge, electron-builder etc.

You may refer to this [document](https://refreshie.think.dj/docs/#/) and follow a similar approach for cloud builds (Windows/MacOS/Linux).
