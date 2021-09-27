#Make the data reproducible:
Configurazione <- c(rep("Baseline", 2), rep("SIMD", 2), rep("Multicore", 2), rep("SIMD\nMulticore", 2))
Legenda <- gl(2, 1, 8, labels=c("Color", "Monochrome"))
Tempo <- c(58.7904, 25.2795, 58.7885, 25.2837, 20.8074, 10.3086, 21.2568, 10.961)

d <- data.frame(Configurazione=Configurazione, Legenda=Legenda, Tempo=Tempo)

require(ggplot2) 

png("execution_time.png", width = 800, height = 450)

ggp <- ggplot(d) + geom_bar(aes(x=Configurazione, y=Tempo, fill=Legenda), stat="identity", position=position_dodge()) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10))

ggp = ggp + theme(text = element_text(size = 20)) + theme(legend.key.size = unit(1, 'cm'),
                                                    legend.key.height = unit(1, 'cm'), legend.key.width = unit(1, 'cm'))

print(ggp)

dev.off()



