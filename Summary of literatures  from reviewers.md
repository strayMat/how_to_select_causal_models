# Reviewer 1

Other reference on g-computation to consider in the study can be for example:

-       [Le Borgne et al. 2021](https://www.nature.com/articles/s41598-021-81110-0)

> Main goal : comparisons of ML techniques for causal inference Model selection : ROC AUC for  6 ML models used as S-learner by adding the treatment as covariate : penalized regressions (L1 and elastic net) with interactions (same as T-Learner wo interactions), one hidden NN, SVC, boosted CART, Super learner (all wo boosted cart). 
> Simulations : 2 scenarii (realistic: with 22 covariates, step, quadratic, linear links and simple : 9 independant covariates ), various sampling size.  Performance : therorical ATE with a logistic regression fitted on random generation of the treatment for their dataset. A bit strange, but it should be equivalent to comparison to mean difference in case of randomization.  Results : Hard to tell, since there are no SE on results so I am dubious that any of the results are significants. 

-       https://www.sciencedirect.com/science/article/pii/S0167947306002076
-       https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-023-01835-6
-       https://pubmed.ncbi.nlm.nih.gov/34861799/


Finally, I note that the paper mentions inference methods specific to machine learning (random forest, etc.). In this regard, there is a great deal of study in the literature as to their actual usefulness in this field. I suggest the authors consider/review some of the following literature in the paper (those that the authors consider most appropriate to be included in their manuscript):

https://link.springer.com/book/10.1007/978-3-031-35051-1

https://www.causal-machine-learning.com/

https://www.frontiersin.org/journals/bioinformatics/articles/10.3389/fbinf.2021.746712/full

https://www.research-collection.ethz.ch/handle/20.500.11850/650703

https://aisel.aisnet.org/pacis2022/181/

or some other that can be easily found in literature.



# Reviewer #2

Another question: do the differences between risks in experiments follow known theoretical results?  For example, it is well known (e.g. https://www.semanticscholar.org/reader/112aba9c62f98b9684693f4c20c30274bc9eb1dc or [Rudas ans jaroszewisz, 2017](https://link.springer.com/content/pdf/10.1007/s10618-018-0576-8.pdf)) that the tau risk performs poorly.

> The second paper is from the uplift regression lit. It takles full randomisation problms and linear specification with gaussian  predictors. It shows theoretically that the T learner (called double model approach) has smaller asymptotical variance than a treatment ratio reweighted outcome S learner. However in non normal cases the  t learner can be ill defined or with high variances. They propose a corrected reweighted Slearner approach to reduce its variances. They show empirically that it behave better than its non corrected version on one and two real world problems. I am not sures to see the link with the tau risk, it does compare risks but corrected s vs tlearners and only looks at randomised linear pbs.**