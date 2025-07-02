FROM python:3.13.5-alpine3.22
#define o diretório de trabalho dentro do contêiner
WORKDIR /app
#copia o arquivo de requisitos e instala as depedências
#Usamos --no-cache-dir para evitar o cache do pip, reduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

#  Expõe a porta que a aplicação FastAPI irá rodar (padrão é 8000)
EXPOSE 8000

# Comando para iniciar a aplicação usando uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000",  "--reload"]
