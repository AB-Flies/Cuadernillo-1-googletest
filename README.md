# Índice
- [Instalación](#Instalación)
- [Uso](#Uso)
- [Tests](#Tests)
    - [Ejemplo `tcalendarioTest.cpp`](#Ejemplo-tcalendarioTest.cpp)
- [`main.cpp` y `universidad_makefile`](#maincpp-y-universidad_makefile)
- [Carpeta .vscode](#Carpeta-vscode)
    - [Posibles problemas](#Posibles-problemas)

# Instalación 
Ejecuta `git clone https://github.com/AB-Flies/Cuadernillo-1-googletest` y se creará una carpeta con el proyecto

# Uso
Las carpetas include, lib y src son las del cuadernillo. Contienen los archivos de cabecera (.h) e implementación (.cpp) de las clases y main.cpp. 

**Para compilar los tests, colócate en la carpeta raíz del proyecto y ejecuta el comando `make`** o `make {nombre del test sin ninguna extensión}` si solo quieres compilar un archivo de tests, por ejemplo `make tcalendarioTest`.
La primera vez que compiles los tests tardará un poco porque se estarán compilando los archivos .a y .o de la librería googletest, las posteriores compilaciones serán mucho más rápidas

> **Aviso:** Por la naturaleza de los tests, es posible que no compilen correctamente si no existe ninguna implementación para el constructor por defecto o destructor de la clase en cuestión. Para que compilen, basta con añadir las funciones vacías (`TCalendario::~Tcalendario() {}` por ejemplo).

**Los ejecutables se generarán en la carpeta `tests/executables`.** Si deseas cambiar la carpeta donde se generan los ejecutables, accede al archivo makefile y cambia 
la línea `OUTPUT_DIR=./tests/executables`. Por ejemplo, si deseas que se generen en la carpeta raíz cámbiala por `OUTPUT_DIR=.`. 

# Tests

Los tests unitarios se escribirán en los archivos tcalendarioTest.cpp, tlistacalendarioTest.cpp y tvectorcalendarioTest.cpp en la carpeta tests. Se usará la siguiente sintaxis:

```
TEST(/*nombre del grupo de tests*/, /*nombre del test*/) {
    /* Código */
}
```

Para generar tests básicos puedes usar las siguientes funciones de la librería googletests:
* ASSERT_EQ(), ASSERT_NE()
* EXPECT_EQ(), EXPECT_NE()
  
Reciben dos argumentos, ASSERT_EQ() y EXPECT_EQ() comprueban que sean iguales y ASSERT_NE() y EXPECT_NE() comprueban que no lo sean. La diferencia entre ASSERT y EXPECT es que si ASSERT falla, el test para, pero si EXPECT falla, el test se sigue ejecutando

Para más información sobre como escribir los tests visitar la [documentación de googletests](https://google.github.io/googletest/) o la [referencia de funciones](https://google.github.io/googletest/reference/assertions.html).

## Ejemplo `tcalendarioTest.cpp`

```
// Para testear las clases, los atributos se han puesto como públicos temporalmente

TEST(constructors, defaultConstructor) {
  TCalendario calen;

  EXPECT_EQ(calen.mensaje, nullptr);
  EXPECT_EQ(calen.dia, 1);
  EXPECT_EQ(calen.mes, 1);
  EXPECT_EQ(calen.anyo, 1900);
}

TEST(constructors, overloadedConstructor) {
  TCalendario calen(9, 2, 1984, "Nació Kiko Rivera");

  // Si calen.mensaje es nulo, la siguiente línea generará error por tratar de evaluar
  // Usamos ASSERT para que si falla, no se continúe evaluando el test para evitar dicho error
  ASSERT_NE(calen.mensaje, nullptr);
  EXPECT_EQ(calen.mensaje[0], 'N');
  EXPECT_EQ(calen.mensaje, "Nació Kiko Rivera");
  EXPECT_EQ(calen.dia, 9);
  EXPECT_EQ(calen.mes, 2);
  EXPECT_EQ(calen.anyo, 1984);
}
```

# `main.cpp` y `universidad_makefile`

`universidad_makefile` es el makefile que se proporciona en la asignatura.

`main.cpp` es el archivo que compila `universidad_makefile` y donde se espera que pongas las pruebas. 

Usando la librería googletest ambos archivos pueden ser ignorados. Sin embargo, en el examen de las prácticas supongo que no se podrá usar la librería así que merece la pena practicar tests en main.cpp. Si deseas hacerlo, cambia el nombre de `universidad_makefile` a makefile y ejecuta `make` igual que antes. El ejecutable resultante se llamará tad y se creará en la carpeta raíz. Para limpiar los archivos intermedios (.o) ejecuta `make clean` en el terminal.

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

Si has cambiado donde se generan los ejecutables deberás cambiar también el archivo `run_test.sh` y poner la misma ruta.
