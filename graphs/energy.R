#Make the data reproducible:
Configurazione <- c(rep("Baseline", 2), rep("SIMD", 2), rep("Multicore", 2), rep("SIMD\nMulticore", 2))
Legenda <- gl(2, 1, 8, labels=c("Color", "Monochrome"))
Energia <- c(84.42, 38, 67, 32, 58, 41, 57, 41)

d <- data.frame(Configurazione=Configurazione, Legenda=Legenda, Energia=Energia)

require(ggplot2) 

png("energy.png", width = 800, height = 450)

ggp <- ggplot(d) + geom_bar(aes(x=Configurazione, y=Energia, fill=Legenda), stat="identity", position=position_dodge()) + 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10))

ggp = ggp + theme(text = element_text(size = 20)) + theme(legend.key.size = unit(1, 'cm'),
                                                          legend.key.height = unit(1, 'cm'), legend.key.width = unit(1, 'cm'))

print(ggp)

dev.off()

