# 🚀 Mantenix: El Asistente de Mantenimiento Definitivo para Linux

> Creado por **RichyKunBv** | Versión actual del script: **3.0**

Un script de terminal potente y amigable diseñado para simplificar el mantenimiento de tu sistema Linux. Con un menú interactivo, automatiza las tareas de actualización, limpieza y optimización para las familias de distribuciones más populares: **Debian**, **Fedora** y **Arch**.



---

## ✨ Características Principales

-   🐧 **Soporte Multi-Distro¹:** Detecta automáticamente si usas una distribución basada en Debian (Ubuntu, Mint), Fedora (RHEL, CentOS) o Arch (Manjaro, EndeavourOS) y aplica los comandos correctos.
-   🔄 **Actualización Completa²:** Actualiza los repositorios nativos (`apt`, `dnf`, `pacman`), paquetes de **Flatpak** y **Snap**, e incluso paquetes de **AUR** si tienes `yay` o `paru` instalado.
-   🧹 **Limpieza Profunda³:** Elimina paquetes huérfanos, limpia la caché de paquetes y reduce el tamaño de los logs del sistema (`journalctl`) para liberar espacio valioso.
-   🛠️ **Optimización del Sistema⁴:** Verifica la integridad de los paquetes instalados y optimiza las bases de datos del gestor de paquetes para un rendimiento más rápido y fiable.
-   🤖 **MODO DIOS⁵:** Una opción para ejecutar una secuencia completa de mantenimiento (actualización profunda, limpieza y optimización) con un solo comando. ¡Ideal para un mantenimiento completo!
-   ⬆️ **Auto-Actualización⁶:** El script puede buscar y descargar su versión más reciente directamente desde GitHub para que siempre tengas las últimas mejoras.
-   🔐 **Ejecución Segura⁷:** Requiere explícitamente privilegios de superusuario para funcionar, asegurando que solo tú autorices los cambios en tu sistema.
  
---

## ⚙️ Instalación y Ejecución (El Método Universal)

Olvídate de clonar repositorios. Abre una terminal y ejecuta este comando para descargar la última versión y darle permisos.

**Instalacion Universal**

```bash
curl -L -o MantenixL.sh [https://raw.githubusercontent.com/RichyKunBv/Mantenix/main/MantenixL.sh]
```


<details>
<summary>Haz clic aquí para ver las instrucciones para Debian</summary>

### 1. Obtener el script
Tienes dos maneras de hacerlo, elige la que prefieras:

* **Opción A (La más fácil):**
    > Descarga el archivo `MantenixL.sh` desde el repositorio de GitHub. Guárdalo en una carpeta que ubiques fácilmente, como **Descargas**.

* **Opción B (Para usuarios de Git):**
    > Si prefieres usar la terminal, clona el repositorio completo:
    > ```bash
    > git clone [https://github.com/RichyKunBv/Mantenix.git](https://github.com/RichyKunBv/Mantenix.git)
    > ```

### 2. Abrir una terminal en el lugar correcto
> Este paso es clave. Ve a la carpeta donde guardaste el script (p. ej., **Descargas** o la nueva carpeta `Mantenix` si usaste git). Una vez dentro, haz **clic derecho** en un espacio vacío y busca la opción **"Abrir en una terminal"**.
>
> *(Como sé que te gusta XFCE, en su gestor de archivos Thunar la opción aparece directamente al hacer clic derecho. ¡Muy práctico!)*

### 3. Dar permisos y ejecutar
> Con la terminal abierta en la carpeta correcta, solo necesitas usar estos dos comandos:

* **Para darle permiso de ejecución:**
    ```bash
    chmod +x MantenixL.sh
    ```

* **Para ejecutar el asistente (siempre con `sudo`):**
    ```bash
    sudo ./MantenixL.sh
    ```
¡Listo! El menú del asistente aparecerá y podrás empezar a darle mantenimiento a tu sistema Debian/Ubuntu.

</details>

<details>
<summary>Haz clic aquí para ver las instrucciones para Fedora</summary>

### 1. Obtener el script
Tienes dos maneras de hacerlo, elige la que prefieras:

* **Opción A (La más fácil):**
    > Descarga el archivo `MantenixL.sh` desde el repositorio de GitHub. Guárdalo en una carpeta que ubiques fácilmente, como **Descargas**.

* **Opción B (Para usuarios de Git):**
    > Si prefieres usar la terminal, puedes clonar el repositorio completo (puede que necesites instalar git primero con `sudo dnf install git`):
    > ```bash
    > git clone [https://github.com/RichyKunBv/Mantenix.git](https://github.com/RichyKunBv/Mantenix.git)
    > ```

### 2. Abrir una terminal en el lugar correcto
> Este paso es clave. Ve a la carpeta donde guardaste el script (p. ej., **Descargas** o la nueva carpeta `Mantenix`). Una vez dentro, haz **clic derecho** en un espacio vacío y busca la opción **"Abrir en una terminal"**.
>
> *(En la versión por defecto de Fedora con GNOME, esta opción suele estar disponible en el gestor de archivos. Si por alguna razón no la encuentras, siempre puedes abrir una terminal y navegar manualmente con el comando `cd ~/Descargas`.)*

### 3. Dar permisos y ejecutar
> Con la terminal abierta en la carpeta correcta, solo necesitas usar estos dos comandos:

* **Para darle permiso de ejecución:**
    ```bash
    chmod +x MantenixL.sh
    ```

* **Para ejecutar el asistente (siempre con `sudo`):**
    ```bash
    sudo ./MantenixL.sh
    ```
¡Listo! El menú del asistente aparecerá, detectará tu sistema Fedora y podrás empezar a darle mantenimiento.

</details>



<details>
<summary>Haz clic aquí para ver las instrucciones para Arch</summary>

### 1. Obtener el script
Tienes dos maneras de hacerlo, elige la que prefieras:

* **Opción A (La más fácil):**
    > Descarga el archivo `MantenixL.sh` desde el repositorio de GitHub y guárdalo en una carpeta que ubiques fácilmente, como **Descargas**.

* **Opción B (Recomendada para usuarios de Arch):**
    > Es muy probable que ya tengas `git` instalado. Clona el repositorio directamente desde la terminal:
    > ```bash
    > git clone [https://github.com/RichyKunBv/Mantenix.git](https://github.com/RichyKunBv/Mantenix.git)
    > ```

### 2. Abrir una terminal en el lugar correcto
> Los usuarios de Arch suelen preferir la terminal. Simplemente navega a la carpeta donde está el script.
> ```bash
> # Navega a la carpeta de descargas
> cd ~/Descargas
> 
> # O a la carpeta del repo si lo clonaste
> cd Mantenix
> ```
> *(Por supuesto, el método de hacer **clic derecho -> "Abrir en terminal"** también funciona en la mayoría de gestores de archivos como Dolphin, Thunar o Files, dependiendo de tu entorno de escritorio.)*

### 3. Dar permisos y ejecutar
> Ya en la carpeta correcta, solo te quedan estos dos comandos:

* **Para darle permiso de ejecución:**
    ```bash
    chmod +x MantenixL.sh
    ```

* **Para ejecutar el asistente (siempre con `sudo`):**
    ```bash
    sudo ./MantenixL.sh
    ```
¡Listo! El menú del asistente aparecerá, reconocerá tu sistema Arch y podrás empezar a darle mantenimiento, **incluyendo los paquetes del AUR si tienes `yay` o `paru`**.

</details>

</details>


---


<details>
<summary>NOTAS</summary>


1.  **Compatibilidad de Distribuciones:** La compatibilidad está garantizada para las versiones base estables de Debian, Fedora y Arch. Aunque se espera que funcione en la mayoría de sus derivados (como Ubuntu, Mint, Manjaro), podrían existir diferencias menores no contempladas en paquetes o configuraciones específicas.

2.  **Estabilidad de las Actualizaciones:** Mantenix automatiza la ejecución de los gestores de paquetes nativos (`apt`, `dnf`, `pacman`). La estabilidad, éxito o posibles conflictos de las actualizaciones dependen enteramente de los repositorios que el usuario tenga configurados y del estado general de su sistema. Se recomienda tener copias de seguridad de los datos importantes.

3.  **Uso de la Limpieza Profunda:** La función de limpieza elimina cachés de paquetes y, en algunos sistemas, kernels antiguos para liberar espacio. Esta acción es, en general, irreversible y podría dificultar el "downgrade" (volver a una versión anterior) de un paquete específico. Úsese con precaución en sistemas de producción críticos.

4.  **Alcance de la Optimización:** La "optimización" se refiere a tareas de mantenimiento del gestor de paquetes, como la verificación de paquetes corruptos y la limpieza de metadatos. Esta función no modifica configuraciones del kernel, del sistema de arranque ni realiza acciones de "overclocking".

5.  **MODO DIOS:** Esta función ejecuta de forma secuencial y sin pedir confirmación adicional las tareas de "Actualización Profunda", "Actualización Estándar", "Limpieza Profunda" y "Optimización". Es una acción potente y se recomienda ejecutarla con pleno conocimiento de las tareas que involucra.

6.  **Requisitos de la Auto-Actualización:** La función de auto-actualización requiere una conexión a internet activa para contactar con los servidores de GitHub.com, así como tener instalada en el sistema alguna de las herramientas de descarga `curl` o `wget`.

7.  **Privilegios de Superusuario:** Todas las operaciones de mantenimiento que realiza el script (instalar, eliminar o modificar paquetes y archivos del sistema) requieren privilegios de administrador. Por seguridad, el script verificará que se ejecute con `sudo` y se detendrá si no los tiene.

</details>

