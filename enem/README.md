1. Baixar arquivo em https://www.kaggle.com/gbonesso/enem-2016/data
2. Descompactar arquivo
> * (*Opcional*) Há 8.627.367 exemplos disponíveis no arquivo, e o tempo de computação pode ser alto caso todos os exemplos sejam filtrados e analisados. Para trabalhar apenas com uma parte dos dados, execute o código abaixo, onde `xxxx` é o número de exemplos que você deseja utilizar:
>  ```
>  head -xxxxx microdados_enem_2016_coma.csv > temp_data.csv
>  mv temp_data.csv microdados_enem_2016_coma.csv    
>  ```
> > * Este comando irá selecionar apenas os primeiros `xxxx` exemplos do arquivo.
3. Converter arquivo de iso-8859-1 para UTF-8:
```
iconv -f iso-8859-1 -t UTF-8 microdados_enem_2016_coma.csv > enem_data.csv
```
4. O nome de intituições pode conter vírgulas, o que dificulta a leitura do arquivo csv. Por isto, é necessário remover os exemplos que possuam mais de 165 vírgulas, caso contrário os dados não serão importados corretamente. Para remover os exemplos que não possuam 165 vírgulas, execute o arquivo `prepare_data.py`:
```
python3 prepare_date.py
```