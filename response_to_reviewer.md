# Reviewer 1

I appreciate the approch and the level of detail that this paper offers on an issue that is, to say the least, a hot topic in bioinformatics and data science in general: the evaluation of the best 'error' model when choosing a causal model for predictive purposes. Indeed, there is much confusion on the subject and very often error models are applied without any real awareness of their potential and limitations.

That is why I think the paper can be of great educational value as well as research.

Of particular interest is the statement "the best predictor may not estimate best causal effects".
Central to the understanding of the paper is Figure 1 and the concept it seeks to explain. The figure clearly shows that if we rely on R^2, a predictor is preferred which on average is efficient but not on estimating causal quantities. The authors conceivably state that "The problem is that causal estimation requires controlling an error on both treated and non-treated outcome for the same individual.". Consequently, they report on estimator that attempt to consider this (in Section "Methods"). However, I cannot understand how this hint ("controlling error on both treated and non-treated sample (or patient?)") has been implemented by the procedure the authors describe in Equations (1), (2), and (3). If, I correctly understand", in Eq. (2) we see the g-computation estimators, a well-known concept introduced by [21] (and recently used also by https://www.nature.com/articles/s41598-020-65917-x ), that splits the two configurations "treated" and "non-treated".

Other reference on g-computation to consider in the study can be for example:

-       [Le Borgne et al. 2021](https://www.nature.com/articles/s41598-021-81110-0)
-       https://www.sciencedirect.com/science/article/pii/S0167947306002076
-       https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-023-01835-6
-       https://pubmed.ncbi.nlm.nih.gov/34861799/

I understand that Eq. (2) and in Eq. (3) consider both treated and non-treated sample (or patient?), but those sums can be also equal to 0, even if their single terms are different from 0. Moreover, it is not clear if, and how Eq. (3) is related to Eq. (2): is it a variant? Is Eq. (3) derived from Eq. (2) under special assumptions?

> Eq. (3) is the definition of the estimator of the ATE based on a model of the outcome. It is sometimes called g-estimation. It  is unbiased under under consistency (Assumption. 3) and unconfoundedness (Assumption 1).  To prove that, take the expectation of Eq. (3).  Then apply  Eq. (1) which is true under consistency (Assumption 3) and unconfoundedness (Assumption 1). Then by the law of total expectancy, the conditionnality on X disappear and we recover Eq. (2).


Furthermore, the Robinson decomposition (R-decomposition) should be better discussed and its role in the context of causal inference should be better commented.
R-decomposition introduces two quantities, the conditional mean outcome and the probability to be treated (known as propensity score). What is the role of the propensity score? How is it calculated? Is it calculated simply by a frequentist approach (number fo treated/total number of patients?

> The R-decomposition can be understood  as a writing trick that separate the mean outcome from the treatment effect. The mean outcome is the part of the counterfactual outcome that can be best estimated from the full population (treated or not). The treatment effect $(a-e(x)) \tau(x)$ should take into account the difference between the two population covariates which is captured by the propensity score.  

> The R-decomposition inspires two different risks, this is why we are introducing it here. I developped a little bit on the role of this decomposition and why we are introducing it. 

> The propensity score is a nuisance quantity that is necessary to estimate . 


Finally, I note that the paper mentions inference methods specific to machine learning (random forest, etc.). In this regard, there is a great deal of study in the literature as to their actual usefulness in this field. I suggest the authors consider/review some of the following literature in the paper (those that the authors consider most appropriate to be included in their manuscript):

https://link.springer.com/book/10.1007/978-3-031-35051-1

https://www.causal-machine-learning.com/

https://www.frontiersin.org/journals/bioinformatics/articles/10.3389/fbinf.2021.746712/full

https://www.research-collection.ethz.ch/handle/20.500.11850/650703

https://aisel.aisnet.org/pacis2022/181/

or some other that can be easily found in literature.



# Reviewer 2

Overall assessment:

Let me begin with positive comments.  I think the paper is very important because it describes a sophisticated methodology for experimental examination of causal models.
Despite some attempts this is still lacking in literature.  I especially like the simulation scheme which uses different features for data generation and learning models.  Moreover thorough experimental evaluations of causal models are not very frequent making the paper important.  Code is available on Github which is a big plus.

I am however not sure about the overall conclusions, which are that R-risk is always the best.  Performance of risk functions may depend on several factors and the overall best performance might be a result of bias in available data.  The only factor taken into account by the authors is overlap.  However, only one type of lack of overlap is tested in experiments, based on shifted Gaussians.  This will likely lead to violation of the positivity assumption.  How about different scenarios, e.g.: perfect overlap but different treatment/control distributions?  Confounding need not necessarily lead to lack of overlap.  Another possible factor is the ratio of causal effect to background responses.  It is known that it may affect relative performance of HTE estimators.

Overall: I am no fully convinced that R-risk is always the best.  The answer could be dependent on other factors and I hope the authors would explore more scenarios.

Another question: do the differences between risks in experiments follow known theoretical results?  For example, it is well known (e.g. https://www.semanticscholar.org/reader/112aba9c62f98b9684693f4c20c30274bc9eb1dc or [Rudas ans jaroszewisz, 2017](https://link.springer.com/content/pdf/10.1007/s10618-018-0576-8.pdf)) that the tau risk performs poorly.

> The second paper is from the uplift regression literature. It focus on full randomization problems and a linear specification with gaussian predictors. It shows theoretically that a linear T-learner (called double model approach in their approach) has smaller asymptotical variance than a treatment ratio reweighted outcome S learner. However, they note that in non normal cases the  T-learner can be ill-defined or with high variance. They propose a corrected reweighted S-learner approach to reduce this  variance. They show empirically that it behaves better than the non corrected version on a simulation and two real world problems. 
> I am not sure to see the link with the tau-risk. The paper does not compare risks but corrected or uncorrected vs T-learners. In addition, they only consider full randomization and linear problems. In our case, we consider a more general setting with a variety of data generation procedures and we focus on non-randomized situations where the distribution of the treatment is conditioned by the predictors.


Another problem is that the paper is hard to follow. The authors rapidly switch between topics: risk, selection, nuisance parameter estimation so the reader quickly gets lost.  The sections in supplementary materials contain important information but not all are referenced in main text.  The paper gives an impression of several experiments put together in some order without guiding the reader through the maze.  I think organization should be improved before publication.

Other comments:
---------------

In the Methods section g-computation is described.  It seems indeed the first name under which the technique appeared in literature, but other names, most importantly S-learner are being used frequently nowadays.  Interestingly those names are mentioned in Empirical study on page 4, however, the close relationship (equivalence?) between S-learner and g-computation is not mentioned.

> G-computation is larger than S-learner. The first mention of S-learner that we are aware of is [Künzel, 2019](https://arxiv.org/pdf/1706.03461). In this paper, they distinguish T-learners from S-learners (or more elaborated ones). T-learners model $\mu(0)$ and $\mu(1)$ separately and train separately on each population. On the contrary S learner use only one model for both population and add the treatment as a covariate. A good example to understand the difference is to note that a linear T-learner is the same thing as a linear S-learner where we add an interaction term between the treatment and the covariates. Ultimately, both methods are G-computation in the sense that they rely on the identification of eq. (1) making the link between potential outcomes and observed quantities. To improve the manuscript, we added just after the eq. (3) that one can choose to model the response function with either a T-learner or a S-learner.

Equation 2: should the expectation be over X not Y?

> Thanks for the remark. We corrected a typo in the equation. There should not have any mention of X in the conditional expectation. 

page 17: proposition number is missing

> Thanks. Fixed.

A.7: the data generation procedure needs better explanations.  Why not call (7) P(d|A) since that's how its used later?  On page 17 you say '[b1,bD]~P(x)' and later 'x~P(x)' which causes confusion.  Also, how are beta vectors generated?

page 4: TLearner uses different feature representation for each treatment arm.  Does this really happen in practice?  Usually all subgroups are described with the same set of features.

> It is indeed true that all subgroups are described with the same set of features. However, 

page 4/5: Family of candidate estimators: why are only linear models used in some dataset and forests for other?  The leaf sizes of forests are chosen from a rather small range, why not use some percentage of the size of the training set?

> The choice of the candidate family of estimators was guided by the idea to compare estimators that are not too different from each other, making the model selection task more challenging. The important point is that we are not focusing on the best possible estimator but on the best possible model selection procedure. To identify the optimal procedure, it is more convincing to compare close candidate estimators than a wide variety of candidate estimators. In the later case, one estimator could dominate all other estimators for every selection procedure. This explains why we are choosing a narrow range of leaf sizes for the forests.

> For the simulations we chose estimators that are out of the functional class of the  true data generation process but are quite similar to it. They are out of the funtional class because the representers are different from the one of the true data. They are close because they have the same functional form : a linear model on top of representers. We used the simulation to explore the wider range of data generation processes, focusing on a gradient of overlap. Because of the sheer number of generated dataset, we did not include computationnaly costly boosted trees in the candidate family.  than the one used for the data generation process. An important point is that the . For the semi-simulated datasets, we chose . For a forest estimator, a T learner or a S learner are quite similar . The fact that the . 

Language comments:
------------------

It seems that English might need improvement in some cases, for example:

Abstract: "We study such a variety of model selection procedures in practical settings": a "large variety" seems more appropriate.

On page 1, the sentence "Predictive modeling bridges to causal inference theory under the name of outcome models ..." contains "bridges under the name" which also sounds strange.

On page 2: In the sentence "Then we anchor causal model selection in the potential outcome framework and details the causal risks and model-selection procedure." I believe 'details' should be 'detail'.

Algorithm 1: 'a candidate estimators f' should be 'a candidate estimator f'

throughout: "an RBF expansion" is more commonly used than "a RBF expansion"

page 4: 'for both population' should be 'for both populations'



