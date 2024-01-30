# Instalación 
Ejecuta `git clone https://github.com/AB-Flies/Cuadernillo-1-googletest` y se creará una carpeta con el proyecto

# Uso
Las carpetas include, lib y src son las del cuadernillo. Contienen los archivos de cabecera (.h) e implementación (.cpp) de las clases y main.cpp. 

**Para compilar los tests, colócate en la carpeta raíz del proyecto y ejecuta el comando `make`** o `make {nombre del test sin ninguna extensión}` si solo quieres compilar los de un test, por ejemplo `make tcalendarioTest`.
La primera vez que compiles los tests tardará un poco porque se estarán compilando los archivos .a y .o de la librería googletest, las posteriores compilaciones serán mucho más rápidas

> **Aviso:** Por la naturaleza de los tests, es posible que no compilen correctamente si no existe ninguna implementación para el constructor por defecto o destructor de la clase en cuestión. Para que compilen, basta con añadir las funciones vacías (`TCalendario::~Tcalendario() {}` por ejemplo).

**Los ejecutables se generarán en la carpeta `tests/executables`.** Si deseas cambiar la carpeta donde se generan los ejecutables, accede al archivo makefile y cambia 
la línea `OUTPUT_DIR=./tests/executables`. Por ejemplo, si deseas que se generen en la carpeta raíz cámbiala por `OUTPUT_DIR=.`. 

# Tests

# Carpeta .vscode
Esta carpeta tiene como propósito asignar un **atajo de teclado para compilar y ejecutar los tests unitarios de la práctica**. Si no estás usando vs code como editor de código, puedes eliminarla. 

Si deseas configurar el atajo de teclado. Accede al archivo keybindings.json (pulsa `f1` y busca `Preferences: Open Keyboard Shortcuts (JSON)` y copia después del último `}` el siguiente código:

```
,
    {
        "key": "ctrl+alt+enter",
        "command": "workbench.action.tasks.runTask",
        "args": "Run test",
        "when": "editorTextFocus && config.workspaceKeybindings.myAwesomeTask.enabled"
    }
```

Cambia el valor de "key" para asignar el atajo que prefieras.

Puedes usar el atajo de teclado desde el archivo de cabecera (.h), el archivo de implementación (.cpp) o el archivo que contiene los tests. 

## Posibles problemas
Cuando trates de usar el atajo de teclado puede que te salte un error `permission denied`. En este caso ejecuta el comando `chmod +x ./.vscode/run_test.sh` en la carpeta raíz del proyecto. No funciona en Windows.
