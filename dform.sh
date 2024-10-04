#!/bin/bash
#dForm - Formatador de Dispositivos 
#versão: 1.0 
#autor: Alexandre (ask4n)

echo "+========================================================================+"
echo "|dForm - Formatador de Dispositivos (Partições, PenDrives, SD Cards, etc)|"
echo "+========================================================================+"

sleep 1
echo "-> Listando dispositivos..."
echo
sleep 1
cat /proc/partitions
echo
echo "-> Digite a unidade do dispositivo a ser formatado: Exemplo -> sda2, sdb1"
read unid
echo
sleep 1
echo "Formatos disponíveis:"
echo "- vfat
- ext2
- ext3
- ext4
- ext4dev
- ntfs
- btrfs
- cramfs
- minix
- msdos
- xfs"
echo "-> Qual o formato desejado para o dispositivo?"
read form
echo
echo "OK, iniciando..."
sleep 1
echo "Desmontando Unidade..."
sleep 1
sudo umount /dev/$unid 2> /dev/null
sleep 1

#Iniciando formatação
echo "Formatando..."
sudo mkfs.$form /dev/$unid > /dev/null
if [[ $? -ne 0 ]]
   then
       echo "Problema na formatação!"
   else 
       echo
       echo "+====================+"
       echo "|Formatação Concluída| Dispositivo: /dev/$unid - Formato: $form"
       echo "+====================+"
       echo
fi
