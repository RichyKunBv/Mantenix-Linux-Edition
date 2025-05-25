Asistente de Mantenimiento para Linux (Debian, Ubuntu y derivados)

Este es un script simple pero poderoso para mantener tu sistema operativo Linux actualizado y limpio con solo unos pocos clics. Olvídate de escribir comandos largos y complicados en la terminal.

Características Principales

Fácil de usar: Un menú interactivo te guía en todo momento.

Completo: Actualiza los programas instalados a través de APT, Flatpak y Snap.

Eficiente: Limpia tu sistema de archivos basura para liberar espacio.

Seguro: Realiza las tareas de mantenimiento más importantes de forma segura.

¿Cómo empezar? (Instalación Universal)

No importa si eres un experto o un principiante, estos 3 pasos funcionan para todos.

Paso 1: Obtener el script

Tienes dos maneras de hacerlo, elige la que prefieras:

Opción A (La más fácil):
Simplemente descarga el archivo debian_mantenimiento.sh de este repositorio. Ve al archivo, haz clic en el botón que dice "Raw" y luego, en la nueva página, haz clic derecho y selecciona "Guardar como...". Guárdalo en una carpeta que ubiques fácilmente, como Descargas.

Opción B (Para usuarios de Git):
Si prefieres usar la terminal, clona el repositorio completo:

git clone https://github.com/RichyKunBv/debian_mantenimiento.git

Paso 2: Abrir una terminal en el lugar correcto
Este es el paso más importante para que todo funcione sin errores.

Ve a la carpeta donde guardaste o descargaste el script (por ejemplo, la carpeta Descargas). Una vez dentro, haz clic derecho en un espacio vacío y busca una opción que diga "Abrir en una terminal" o "Abrir terminal aquí".

(Si usaste la Opción B de Git, simplemente entra a la carpeta nueva con cd debian_mantenimiento)

Paso 3: Dar permisos y ejecutar
Ahora que la terminal está abierta en la carpeta correcta, solo necesitas copiar y pegar estos dos comandos, uno por uno:

Para darle al archivo permiso de ejecutarse:


chmod +x debian_mantenimiento.sh
Para ejecutar el asistente (necesita sudo para poder administrar tu sistema):


sudo ./debian_mantenimiento.sh
¡Listo! El menú del asistente aparecerá y podrás empezar a darle mantenimiento a tu PC.

Funcionalidades del Menú
Cada opción está diseñada para ser clara y directa.



Opción 1: Actualización Estándar

¿Qué hace? Es la actualización del día a día. Busca y aplica las nuevas versiones de tus programas principales (manejados por APT) y también de las aplicaciones que tengas de Flatpak y Snap. Mantiene tu software seguro y con las últimas funciones.


Opción 2: Limpiar Sistema

¿Qué hace? Libera espacio en tu disco duro. Elimina paquetes que ya no se necesitan y borra los archivos de instalación temporales que se acumulan con el tiempo. Es como pasar la aspiradora a tu sistema.


Opción 3: Actualización Profunda del Sistema

¿Qué hace? Esta es una actualización más seria. No solo actualiza los programas, sino que también puede manejar cambios importantes en el núcleo de tu sistema operativo. Úsala de vez en cuando, por ejemplo, una vez al mes, para asegurarte de que todo el sistema esté al día.


Opción A: MODO DIOS

¿Qué hace? Es la opción "hacer todo con un solo clic". Realiza la Actualización Profunda (3), luego la Actualización Estándar (1) y finalmente la Limpieza del Sistema (2), todo en una sola secuencia automática. Es la mejor opción para hacer un mantenimiento completo y dejar tu computadora como nueva.


Opción X: Salir

¿Qué hace? Cierra el programa de forma segura.




NUNCA DE LOS NUNCA PONGAN ñ o Ñ por favor no lo hagan
