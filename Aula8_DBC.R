#' ---
#' title: "Experimentação Agronômica UEPG 2024/1"
#' subtitle: "Delineamento em Blocos Casualizados e Quadrados Latinos"
#' professor: Dr. Carlos Tadeu S Dias (ESALQ/USP)
#' aluno: Gabriel Passos
#' date: "07-04-2024"
#'---
#'

# Carregar pacotes
library(AgroR)

# Carregar dados
dados <- read.csv2("dados_aula8.csv", header = T);head(dados)
str(dados)

dados <- transform(dados,
                   blocos = as.factor(blocos),
                   trat = as.factor(trat),
                   repet = as.factor(repet),
                   y = as.numeric(y))
str(dados)

# Análise de um DBC com k repetições (similar a análise convencional)
## Análise realizada tanto por Scott-Knott e por Tukey
# Esta análise usa o pacote 'AgroR' já evocado anteriormente 
with(dados, DBC(trat, blocos, y, mcomp = "sk", angle=45, ylab = "Y"))
with(dados, DBC(trat, blocos, y, mcomp = "tukey", angle=45, ylab = "Y"))

Trat=paste("Tr", 1:6) # Cria um objeto como se houvessem 6 tratamentos
#=============================
# Completely randomized design
#=============================
sketch(Trat,r=3, design="DBC") 
