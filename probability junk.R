### Probability

Assume running late means that the task takes a time greater than the most likely estimate.

Probability that the prior task A runs late - P(A+)
Probability that the subsequent task B runs late - P(B+)

Probability that task B runs late if task A runs late P(A+∩B+) = P(A+) * P(B+|A+)

If we take task A as phase one, and task two as phase two Vendor, we can find the probabilty each task will take more than the most likley estimate by taking 1 - the probability the task will be completed by Tml.

```{r}

# Using triangular distribution
# Tml p1 = 3, Tml p2v = 10

paste("Probability of overrun p1 - ", (1 - ecdf(tsim[,1])(3))*100, "%")
paste("Probability of overrun p2v - ", (1 - ecdf(tsim[,2])(10))*100, "%")

```

```{r}

biprobs <- data.frame(p1 = tsim$V1, p2v = tsim$V2)
biprobs$p1 <- biprobs$p1 - 3
biprobs$p2v <- biprobs$p2v - 10
biprobs$p1o <- "L"
biprobs[biprobs$p1 < 0, 3] <- "S"
biprobs$p2vo <- "L"
biprobs[biprobs$p2v < 0, 4] <- "S"
biprobs$out <- paste(biprobs$p1o,biprobs$p2vo, sep = "")

######

LL <- sum(biprobs$out=="LL")
SS <- sum(biprobs$out=="SS")
LS <- sum(biprobs$out=="LS")
SL <- sum(biprobs$out=="SL")

p_LL <- LL/(LL+SS+LS+SL)

paste("Probability of both overrun - ", (1 - ecdf(tsim[,1])(3))*100, "%")
```

In the simulation the predicted probaility of overrun in p2v if the predicted probabilty of p1 has overrun is 49.3%

If we assume the probaility of a task overruning if it is predicted to overrun is XX

When the task overruns, p100

Therefore, P(A+∩B+) = P(A+) * P(B+|A+)
P(A+∩B+) = 0.654 * 0.493
P(A+∩B+) = 
  
  As the precited probability of A overruning increases,0

0.493 = 0.95 * P(B+|A+)
P(B+|A+) = 0.5189474

The predicted probability of B overrunning decreases.

By inducing correlation in the data, the probability of P(A+∩B+) increases. Increasing the effect 
