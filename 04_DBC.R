#' ---
#' title: "Experimentação Agronômica UEPG 2024/1"
#' subtitle: "Delineamento em Blocos Casualizados"
#' professor: Dr. Carlos Tadeu S Dias (ESALQ/USP)
#' aluno: Gabriel Passos
#' date: "07-04-2024"
#'---
#'

# Carregar os pacotes
library(AgroR)
library(esquisse)
library(ggplot2)

# Carregar a base de dados
dados <- read.csv2("DBC1.csv", header=T)
dados
dados$Blocos <- as.factor(dados$Blocos)
dados$Tratamentos <- as.factor(dados$Tratamentos)

# Realizar a análise exploratória
esquisser(dados)

# Plotagem do gráfico 

ggplot(dados) +
  aes(x = Tratamentos, y = Y, fill = Blocos) + geom_col() +
  scale_fill_hue(direction = 1) + theme_minimal()

# Análise do experimento em DBC (Delineamento em Blocos Casualizados)

# Análise para os dados da laranja (BARBIN, 2013)
data(laranja)
attach(laranja)
DBC(Tratamentos, Blocos, Y, mcomp = "tukey", angle=45, ylab = "Number of fruits/plants")
with(dados, DBC(Tratamentos, Blocos, Y, mcomp = "tukey", angle=45, ylab = "Number of fruits/plants")
)

#dados2 <- dados[-20,]
#with(dados2, DBC(Tratamentos, Blocos, Y, mcomp = "tukey", angle=45, ylab = "Number of fruits/plants"))





