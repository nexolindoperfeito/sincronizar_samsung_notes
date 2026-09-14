sincronizar_samsung_notes

Um script que criei para "destravar" o Samsung Notes para um computador/notebook não oficial da Samsung.

O que esse código vai fazer

Ele vai pegar as informações do seu computador e mudar para parecer um computador Samsung legítimo, não se preocupe, coloquei um backup no código para você não perder as informações antigas numa pasta que nomeei como: backup_bios_original.reg, o que significa que: antes pode estar como Dell, Asus, Acer, Lenovo e o Windows vai começar a ler "Samsung" e "NP950QDB-KA1US".

Atenções antes de rodar

Se você abrir o Notes e fechou, trate de não deixar nenhum resquício dele aberto. No gerenciador de tarefas procure como "notes" e feche completamente para ter garantia que vai funcionar.

Como funciona

Aqui vai solicitar a permissão pro Windows rodar como administrador e o código rodar dentro do Samsung Notes:

bat
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando permissao
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

Aqui vai pegar as informações originais que o Windows está lendo e realizar o backup para não perder:

bat
setlocal
set "REGPATH=HKLM\HARDWARE\DESCRIPTION\System\BIOS"
set "BACKUPFILE=%~dp0backup_bios_original.reg"

reg export "%REGPATH%" "%BACKUPFILE%" /y >nul 2>&1

Aqui vai fazer a mudança logo após o backup ser feito, então o sistema vai começar a ler "Samsung" e "NP950QDB-KA1US", o que faz o Samsung Notes funcionar e pensar que está num Notebook/Computador Samsung:

bat
reg add "%REGPATH%" /v SystemProductName  /t REG_SZ /d "NP950QDB-KA1US" /f
reg add "%REGPATH%" /v SystemManufacturer /t REG_SZ /d "Samsung" /f

Aqui finaliza o código, e se estiver com o Notes aberto é necessário reiniciá-lo:

bat
echo.
echo Concluido. Reinicie o Samsung Notes para aplicar.
pause
Como restaurar

Se quiser voltar os valores originais do seu PC, basta dar duplo clique no arquivo backup_bios_original.reg gerado na mesma pasta do script, e confirmar a mesclagem no registro.

Aviso

Isso altera valores de identificação do seu computador para contornar uma checagem de hardware do Samsung Notes. Use por sua conta e risco, e apenas na sua própria máquina.
