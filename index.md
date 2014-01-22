NOTES ON COALESCENT THEORY
=================================

Spring 2014 -- Peter Ralph -- USC 
http://petrelharp.github.io/coaltheory/outline.html


Notes
=====

Here are links to web pages of notes that roughly follow the course.  They are xhtml, with svg figures, so they might not work in IE; get firefox or opera if you have troubles. Or, download the source from [my github repository](https://github.com/petrelharp/coaltheory) and build whatever you want from the latex.  They are currently (Spring 2014) in rapid upheaval.

1. [Introduction](introduction.xhtml)
2. [Summary statistics (of the realized ancestral recombination graph)](summary-stats.xhtml)

If you use these notes, please cite them, for instance:
  Notes on Coalescent Theory, preprint, Peter Ralph, 2014.  http://petrelharp.github.io/coaltheory
  

Overview
========

This short course is aimed at people with some degree of familiarity with probability and stochastic processes (say, a first-year graduate course).  At the end of each class I will assign a paper to read; everyone is expected to bring, written down, one or two questions or observations about the reading to the next class.  The first hour to hour-and-a-quarter of each class will be lecture (interruptions and questions encouraged); and the remaining part of the class will be spent discussing the paper, guided by the questions contributed by the class (and myself).  The goal of this structure is to complement lecture with the sorts of learning we get by sorting through papers from the literature together, and trying to explain concepts to each other.

I am aiming for the papers we read to complement the lectures: so, there will be things in the papers that we won't have talked about in class, and some things I talk about in class that won't appear in the papers.  I am concurrently writing up lecture notes at http://petrelharp.github.io/coaltheory/ ; comments (edits, pull requests, etc) are welcome.


Expectations
------------

I expect everyone to turn in, at the start of each class, a short (half page or less) of question and/or observation suitable as a topic for discussion from the weekly discussion paper.  At the end of my section of the course (on March 4th), I also expect a two-page writeup either summarizing further readings in the literature, or the results of simulating something we've learned about in class.  An example of the first would be to read a few more papers on a particular topic, and write a summary of the main results, methods, and relationship to current practice.  An example of the second would be to simulate a particular population process of interest, and compare the results to theory.  I will provide suggestions for either, and am open to your ideas.


Readings
========

1. (1/14) [Gene genealogies and the coalescent process](http://web.eve.ucdavis.edu/pbg298/pdfs/Hudson_OxfordSurveysEvolBiol_1991.pdf), Hudson, 1990.  
  This is a review paper, which doesn't give many details, but is a very useful overview.
2. (1/21) [Gene genealogies within a fixed pedigree, and the robustness of Kingman's coalescent.](http://www.ncbi.nlm.nih.gov/pubmed/22234858), by Wakeley, King, Low, and Ramachandran.  This paper examines the effect of correlations due to a fixed pedigree that dissappear in the large-population limit underlying most theoretical results (using a real-life pedigree!).
3. (1/28) 
4. (2/4)
5. (2/11)
6. (2/18)
7. (2/25)
8. (3/4)



Outline (tentative)
=======

1. Pedigrees and inheritance, and statistics of the realized ancestral recombination graph (ARG)
    * modeling recombination, segregation, and mutation
    * the ARG: embedding of recombination into the pedigree 
    * single-site statistics
        + heterozygosity
        + Fst
        + coalescent time distribution
        + site frequency spectrum
    * multiple-site statistics
        + linkage disequilibrium
        + haplotype blocks  
2. Population models of pedigrees and lineages
    * Moran models
        + haploid
        + diploid
    * Cannings models
    * Lambda coalescents
3. Expected values under population models
    * allele frequencies
        + forwards and reverse processes
        + limiting, continuous process
    * single-site statistics
        + heterozygosity and LD and "effective population size"
        + Ewens sampling/site frequency spectrum from mean time in tree
    * distinction between population distribution and (annealed) expectation
4. Recombination, and blocks
    * decomposition of a sampled set into minimal collection of IBD blocks
    * distribution of age of MRCA of a site is the size-biased version of age of MRCA of a block
    * mean block length spectrum a function of coalescent time distribution
5. Junctions and multiply shared blocks
    * junctions are inherited as Mendelian alleles
    * expected number of genome-wide k-way shared recent blocks
    * parallel to rare variants
6. Bulk coalescent theory
    * law of large numbers for lineages
    * single-lineage relationship to many lineages
    * distribution of longest shared block





Further readings
================

- [The population genealogy of the infinitely-many neutral alleles model](http://www.cmb.usc.edu/people/stavare/STpapers-pdf/DT87a.pdf), Donnelly \& Tavar\'e, 1987.
- [An Ancestral Recombination Graph](http://www.math.canterbury.ac.nz/~r.sainudiin/recomb/ima.pdf), by Griffiths and Marjoram, 1997.
- [An Ancestral Recombination Graph for Diploid Populations with Skewed Offspring Distribution](http://www.genetics.org/content/193/1/255.abstract), by Birkner, Blath, and Eldon, Genetics 2013
- [Coalescent Processes When the Distribution of Offspring Number Among Individuals Is Highly Skewed](http://www.genetics.org/content/172/4/2621.full), by Eldon and Wakeley, 2006.
- [Distribution of Parental Genome Blocks in Recombinant Inbred Lines](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3189807/), by Martin and Hospital, 2011.
- [A Genealogical Interpretation of Linkage Disequilibrium](), by McVean, 2002.
- something by Möhle
- PSMC method, Li and Durbin
- Kelley's paper



Further topics to possibly cover:
================

- recursions for identity by descent
- mean IBD block length spectrum
- dual processes within a given pedigree
- PSMC (Li \& Durbin)
- f-statistics
- ABBA/BABA etc
- long-tailed, beta coalescents
