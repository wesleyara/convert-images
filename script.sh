#!/bin/bash

PWD=$(pwd)

select opt in "Directory" "File" "Quit"; do
  case $opt in
  "Directory")
    clear
    echo "Initializing directory conversion..."
    echo "Enter input format:"
    read input_format

    # Checa se exite arquivo com o input_format
    for files in *.$input_format; do
      if [ ! -f "$files" ]; then
        echo "No files with $input_format format found."
        exit 1
      fi
    done

    clear

    echo "Enter output format:"
    read output_format

    clear

    # Cria o diretório de saída
    echo "Creating output directory..."
    mkdir -p "$PWD/convert-$output_format"

    # Converter todas as imagens do diretótio atual:
    for file in *.$input_format; do
      echo "Converting $file to $output_format..."
      convert "$file" "$PWD/convert-$output_format/${file%.$input_format}.$output_format"
    done

    exit 1
    ;;
  "File")
    echo "Initializing file conversion..."
    sleep 1
    echo "Enter File:"
    read file

    # Checa se o arquivo existe
    if [ ! -f "$PWD/$file" ]; then
      echo "File $file does not exist"
      exit 1
    fi

    clear

    echo "Enter output format:"
    read output_format

    clear

    # Cria o diretório de saída
    echo "Creating output directory..."
    mkdir -p "$PWD/convert-$output_format"

    # Converte o arquivo
    echo "Converting $file to $output_format..."
    convert "$file" "$PWD/convert-$output_format/${file%.*}.$output_format"

    exit 1
    ;;
  "Quit")
    break
    ;;
  *) echo "Invalid option $REPLY" ;;
  esac
done
