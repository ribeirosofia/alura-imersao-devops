FROM python:3.13.5-alpine3.22


# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de requirements primeiro para aproveitar o cache de camadas do Docker
COPY ./requirements.txt /app/requirements.txt

# Instala as dependências da aplicação
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta em que a aplicação FastAPI estará rodando
EXPOSE 8000

# Comando para iniciar a aplicação usando Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
