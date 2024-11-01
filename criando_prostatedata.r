# Crie um data frame com os dados
dados_prostate <- data.frame(
  lcavol = c(0.75, 0.46, -1.35, 1.31, 2.88, 0.69),
  lweight = c(3.43, 3.76, 3.60, 4.12, 3.77, 3.54),
  age = c(62, 49, 63, 64, 68, 58),
  lbph = c(-1.386, 1.423, 1.267, 2.171, 1.558, 1.537),
  svi = c(0, 0, 0, 0, 1, 0),
  lcp = c(-1.39, -1.39, -1.39, -1.39, 1.56, -1.39),
  gleason = c(6, 6, 6, 7, 7, 6),
  pgg45 = c(0, 0, 0, 5, 80, 0),
  lpsa = c(0.37, 2.79, 1.27, 2.09, 5.48, 0.85),
  train = c(TRUE, TRUE, TRUE, FALSE, TRUE, TRUE)
)

# Especifique o caminho onde você quer salvar o arquivo
caminho_arquivo <- "C:\\R_projets\\prostate.data"

# Salve o data frame como um arquivo de texto
write.table(dados_prostate, file = caminho_arquivo, sep = "\t", row.names = FALSE, col.names = TRUE)

# Mensagem de confirmação
cat("Arquivo 'prostate.data' criado com sucesso em:", caminho_arquivo)
