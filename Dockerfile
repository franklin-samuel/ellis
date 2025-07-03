# Usa uma imagem leve baseada em Alpine com Python 3.13.5
FROM python:3.13.5-alpine3.22

# Define a pasta de trabalho no container
WORKDIR /app

# Copia os arquivos de dependências
COPY requirements.txt .

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta usada pela aplicação FastAPI
EXPOSE 8000

# Comando para rodar o servidor FastAPI com Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
