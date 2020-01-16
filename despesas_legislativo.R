# install.packages("devtools")
devtools::install_github("tchiluanda/rsiconfi")

library(rsiconfi)
library(dplyr)
library(tidyr)

###########Trabalhando as despesas

#Monta um vetor com todos os códigos de UFs do Brasil
#Vide https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360021494734-Tabela-de-C%C3%B3digo-de-UF-do-IBGE

#todos_estados<-11 #para efeito de teste considera-se aqui apenas o estado de Rondônia
todos_estados<-c(11:17,21:29,31:35,41:43,50:53) #para execução completa tire o comentário dessa linha
estados_N<-c(11:17)
estados_NE <- c(21:29)
estados_SE<- c(31:35)
estados_S<- c(41:43)
estados_CO <- c(50:53)


#Monta um vetor com as contas que se referem às despesas com legislativo nos municípios
#para saber as contas disponíveis use a função get_account_dca, como indicado abaixo
# df_conta_dca<- get_account_dca(2018, "I-E", c("2312908") )

contas_legislativo<- c("01")




#chama função que traz dados contábeis anuais de todos os municípios de um conjunto de estados
#Atenção, a execução da linha abaixo pode demorar várias horas para execução.
#Caso queira fazer somente um teste sugerimos substituir o vetor de estados.
#Considere usar apenas o estado 11-Rondônia para testes
df_desp_mun<- get_dca_mun_state(year= 2014:2018, #ano a que se refere os dados. poderia ser um vetor de anos
                                annex= "I-E", #Anexo de Contas Anuais que se refere a despesa por função
                                state = todos_estados, #Informa o conjunto de UFs a que se refere os dados recuperados. nesse caso todos as UFs
                                arg_cod_conta = contas_legislativo#Contas associadas ao legislativo
)

df_desp_mun_N<- get_dca_mun_state(year= 2014:2018, #ano a que se refere os dados. poderia ser um vetor de anos
                                annex= "I-E", #Anexo de Contas Anuais que se refere a despesa por função
                                state = estados_N, #Informa o conjunto de UFs a que se refere os dados recuperados. nesse caso todos as UFs
                                arg_cod_conta = contas_legislativo#Contas associadas ao legislativo
)


df_desp_mun_NE<- get_dca_mun_state(year= 2014:2018, #ano a que se refere os dados. poderia ser um vetor de anos
                                  annex= "I-E", #Anexo de Contas Anuais que se refere a despesa por função
                                  state = estados_NE, #Informa o conjunto de UFs a que se refere os dados recuperados. nesse caso todos as UFs
                                  arg_cod_conta = contas_legislativo#Contas associadas ao legislativo
)


df_desp_mun_SE<- get_dca_mun_state(year= 2014:2018, #ano a que se refere os dados. poderia ser um vetor de anos
                                   annex= "I-E", #Anexo de Contas Anuais que se refere a despesa por função
                                   state = estados_SE, #Informa o conjunto de UFs a que se refere os dados recuperados. nesse caso todos as UFs
                                   arg_cod_conta = contas_legislativo#Contas associadas ao legislativo
)


df_desp_mun_S<- get_dca_mun_state(year= 2014:2018, #ano a que se refere os dados. poderia ser um vetor de anos
                                   annex= "I-E", #Anexo de Contas Anuais que se refere a despesa por função
                                   state = estados_S, #Informa o conjunto de UFs a que se refere os dados recuperados. nesse caso todos as UFs
                                   arg_cod_conta = contas_legislativo#Contas associadas ao legislativo
)


df_desp_mun_CO<- get_dca_mun_state(year= 2014:2018, #ano a que se refere os dados. poderia ser um vetor de anos
                                  annex= "I-E", #Anexo de Contas Anuais que se refere a despesa por função
                                  state = estados_CO, #Informa o conjunto de UFs a que se refere os dados recuperados. nesse caso todos as UFs
                                  arg_cod_conta = contas_legislativo#Contas associadas ao legislativo
)

df_desp_mun_2013<- get_dca_mun_state(year= 2013, #ano a que se refere os dados. poderia ser um vetor de anos
                                annex= "I-E", #Anexo de Contas Anuais que se refere a despesa por função
                                state = todos_estados, #Informa o conjunto de UFs a que se refere os dados recuperados. nesse caso todos as UFs
                                arg_cod_conta = contas_legislativo,#Contas associadas ao legislativo
                                In_QDCC = TRUE
)



save(list=c("df_desp_mun_N","df_desp_mun_NE"), file = "df_desp_N_NE.RData")

write.csv2(df_desp_mun_N, file = "desp_legis_mun_N.csv", fileEncoding = "LATIN1")
write.csv2(df_desp_mun_NE, file = "desp_legis_mun_NE.csv", fileEncoding = "LATIN1")
